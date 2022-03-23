#include "datasampler.hpp"

#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>

#include "simulator.hpp"

namespace GreenHouseRuntimeTools {

DataSampler::DataSampler(Simulator *simulator)
    : QAbstractListModel(simulator)
    , m_timer(new QTimer(this))
    , m_simulatir(simulator)
{
    connect(m_timer, &QTimer::timeout, this, &DataSampler::caputreSamples);
    m_timer->setInterval(1000);
}

void DataSampler::setSampleInterval(int interval)
{
    if (m_timer->interval() != interval) {
        m_timer->setInterval(qMax(interval, 50));
        emit sampleIntervalChanged();
        if (m_timer->isActive())
            m_timer->start();
    }
}

QStringList DataSampler::headers() const
{
    QStringList headers;
    for (const auto &source : qAsConst(m_sources))
        headers << source.toString();
    return headers;
}

int DataSampler::rowCount(const QModelIndex &) const
{
    return m_lines.length();
}

QVariant DataSampler::data(const QModelIndex &index, int role) const
{
    if (index.row() >= 0 && index.row() < m_lines.length()) {
        const auto line = m_lines.at(index.row());
        switch (role) {
        case Timestamp:
            return line.timestamp;
        case Values: {
            QStringList values;
            for (const auto &sample : line.samples)
                values << sample.data.toString();
            return values;
        }
        case Headers: {
            QStringList headers;
            for (const auto &sample : line.samples)
                headers << sample.source.toString();
            return headers;
        }
        }
    }
    return QVariant();
}

QHash<int, QByteArray> DataSampler::roleNames() const
{
    return { { Timestamp, "timestamp" }, { Values, "values" }, { Headers, "headers" } };
}

void DataSampler::startSampling()
{
    if (!m_timer->isActive()) {
        m_timer->start();
        emit samplingActiveChanged();
    }
}

void DataSampler::stopSampling()
{
    if (m_timer->isActive()) {
        m_timer->stop();
        emit samplingActiveChanged();
    }
}

void DataSampler::caputreSamples()
{
    beginInsertRows(QModelIndex(), m_lines.length(), m_lines.length());
    m_lines.append(captureLine());
    endInsertRows();
}

void DataSampler::exportCSV(const QUrl &fileUrl) const
{
    QFile file(fileUrl.toLocalFile());
    if (file.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
        {
            QStringList headerList = headers();
            headerList.prepend(QStringLiteral("Timestamp"));
            file.write(headerList.join(QLatin1Char(',')).toLatin1());
            file.write("\r\n");
        }
        for (const auto &line : m_lines) {
            file.write(line.toCSVLine().toLatin1());
            file.write("\r\n");
        }
    }
}

void DataSampler::importCSV(const QUrl &fileUrl)
{
    QFile file(fileUrl.toLocalFile());
    if (file.open(QIODevice::ReadOnly)) {
        if (file.atEnd())
            return;

        const QStringList headers = QString(QLatin1String(file.readLine())).split(QLatin1Char(','));
        if (headers.length() <= 1)
            return;

        stopSampling();
        clear();

        QList<ContextObjectPropertyWrapper *> properties;
        for (int i = 1; i < headers.length(); ++i) {
            const auto source = headers.at(i).split(QLatin1Char('.'));
            if (source.length() == 2) {
                auto iface = m_simulatir->object(source.at(0).trimmed());
                if (iface) {
                    auto property = iface->property(source.at(1).trimmed());
                    if (property) {
                        properties.append(property);
                        m_sources.append({ iface->name(), property->name() });
                    }
                }
            }
        }
        emit headersChanged();

        beginResetModel();
        while (!file.atEnd()) {
            const QStringList values = QString(QLatin1String(file.readLine())).split(QLatin1Char(','));
            if (values.length() > 1) {
                QDateTime timestamp = QDateTime::fromString(values.at(0), Qt::ISODateWithMs);
                Samples samples;
                for (int i = 1; i < values.length() && i <= m_sources.length(); ++i) {
                    const auto property = properties.at(i - 1);
                    const QString strValue = values.at(i).trimmed();
                    switch (property->type()) {
                    case Simulator::String:
                    case Simulator::TranslatableString:
                    case Simulator::ByteArray:
                        samples.append({ m_sources.at(i - 1), strValue });
                        break;
                    case Simulator::Int:
                        samples.append({ m_sources.at(i - 1), strValue.toInt() });
                        break;
                    case Simulator::Double:
                    case Simulator::Float:
                        samples.append({ m_sources.at(i - 1), strValue.toDouble() });
                        break;
                    case Simulator::Bool:
                        samples.append({ m_sources.at(i - 1),
                                         strValue.compare(QStringLiteral("TRUE"), Qt::CaseInsensitive) == 0 });
                        break;
                    default:
                        samples.append({ m_sources.at(i - 1), QVariant() });
                        break;
                    }
                }
                m_lines.append({ timestamp, samples });
            }
        }
        endResetModel();
    }
}

void DataSampler::exportSetup(const QUrl &fileUrl) const
{
    QFile file(fileUrl.toLocalFile());
    if (file.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
        QJsonObject obj;
        obj.insert(QStringLiteral("Internval"), sampleInterval());
        QJsonArray sources;
        for (const auto &source : m_sources)
            sources.append(source.toJson());
        obj.insert(QStringLiteral("Sources"), sources);
        file.write(QJsonDocument(obj).toJson());
    }
}

void DataSampler::importSetup(const QUrl &fileUrl)
{
    QFile file(fileUrl.toLocalFile());
    if (file.open(QIODevice::ReadOnly)) {
        QJsonParseError err;
        const QJsonDocument doc = QJsonDocument::fromJson(file.readAll(), &err);
        if (err.error == QJsonParseError::NoError && doc.isObject()) {
            const QJsonObject obj = doc.object();
            stopSampling();
            clear();
            setSampleInterval(obj.value(QStringLiteral("Internval")).toInt(1000));
            const QJsonArray sources = obj.value(QStringLiteral("Sources")).toArray();
            for (const auto &val : sources)
                m_sources.append(Source::fromJson(val.toObject()));
            emit headersChanged();
        }
    }
}

void DataSampler::addSource(const QString &iface, const QString &property)
{
    Source source;
    source.iface = iface;
    source.property = property;
    if (property.contains(QLatin1Char(' ')))
        source.property = property.split(QLatin1Char(' ')).first();
    else
        source.property = property;
    m_sources.prepend(source);
    emit headersChanged();

    beginResetModel();
    for (int i = 0; i < m_lines.length(); ++i) {
        m_lines[i].samples.prepend({ source, QVariant() });
    }
    endResetModel();
}

void DataSampler::removeSource(int index)
{
    if (index >= 0 && index < m_sources.length()) {
        m_sources.removeAt(index);
        emit headersChanged();

        beginResetModel();
        for (int i = 0; i < m_lines.length(); ++i) {
            if (index < m_lines[i].samples.length())
                m_lines[i].samples.removeAt(index);
        }
        endResetModel();
    }
}

void DataSampler::clear(bool dataOnly)
{
    if (!dataOnly) {
        m_sources.clear();
        emit headersChanged();
    }
    clearLines();
}

void DataSampler::apply(int row, int column)
{
    if (row >= 0 && row < m_lines.length()) {
        const auto line = m_lines.at(row);
        if (column < 0) {
            for (const auto &sample : line.samples)
                applySample(sample);
        } else if (column < line.samples.length()) {
            applySample(line.samples.at(column));
        }
    }
}

void DataSampler::clearLines()
{
    beginResetModel();
    m_lines.clear();
    endResetModel();
}

DataSampler::SampleLine DataSampler::captureLine()
{
    Samples samples;
    for (const auto &source : qAsConst(m_sources)) {
        auto iface = m_simulatir->object(source.iface);
        if (iface) {
            auto property = iface->property(source.property);
            if (property)
                samples.append({ source, property->value() });
        }
    }
    return { QDateTime::currentDateTime(), samples };
}

void DataSampler::applySample(const Sample &sample)
{
    auto iface = m_simulatir->object(sample.source.iface);
    if (iface) {
        auto property = iface->property(sample.source.property);
        if (property)
            property->setValue(sample.data);
    }
}

QString DataSampler::SampleLine::toCSVLine() const
{
    QStringList lst = { timestamp.toString(Qt::ISODateWithMs) };
    for (const auto &sample : samples)
        lst << sample.data.toString();
    return lst.join(QLatin1Char(','));
}

QJsonObject DataSampler::Source::toJson() const
{
    return { { QStringLiteral("Iface"), iface }, { QStringLiteral("Property"), property } };
}

DataSampler::Source DataSampler::Source::fromJson(const QJsonObject &obj)
{
    return { obj.value(QStringLiteral("Iface")).toString(), obj.value(QStringLiteral("Property")).toString() };
}
}
