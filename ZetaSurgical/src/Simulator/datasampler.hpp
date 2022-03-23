/**********************************************************************************************************************
 * (C) Copyright 2022 Integrated Computer Solutions, Inc. - All rights reserved.
 **********************************************************************************************************************/
#pragma once

#include <QAbstractListModel>
#include <QDateTime>
#include <QJsonObject>
#include <QTimer>
#include <QUrl>
#include <QVariant>

namespace GreenHouseRuntimeTools {

class Simulator;
class DataSampler : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(int sampleInterval READ sampleInterval WRITE setSampleInterval NOTIFY sampleIntervalChanged)
    Q_PROPERTY(bool samplingActive READ samplingActive NOTIFY samplingActiveChanged)
    Q_PROPERTY(QStringList headers READ headers NOTIFY headersChanged)

public:
    enum Roles { Timestamp, Values, Headers };

    explicit DataSampler(Simulator *simulator);

    int sampleInterval() const { return m_timer->interval(); }
    void setSampleInterval(int interval);

    bool samplingActive() const { return m_timer->isActive(); }

    QStringList headers() const;

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

public slots:
    void startSampling();
    void stopSampling();
    void caputreSamples();

    void exportCSV(const QUrl &fileUrl) const;
    void importCSV(const QUrl &fileUrl);

    void exportSetup(const QUrl &fileUrl) const;
    void importSetup(const QUrl &fileUrl);

    void addSource(const QString &iface, const QString &property);
    void removeSource(int index);
    void clear(bool dataOnly = false);

    void apply(int row, int column = -1);

signals:
    void sampleIntervalChanged();
    void samplingActiveChanged();
    void headersChanged();

private:
    struct Source {
        QString iface;
        QString property;

        QString toString() const { return QStringLiteral("%1.%2").arg(iface, property); }
        QJsonObject toJson() const;
        static Source fromJson(const QJsonObject &obj);
    };
    using Sources = QVector<Source>;

    struct Sample {
        Source source;
        QVariant data;
    };
    using Samples = QVector<Sample>;

    struct SampleLine {
        QDateTime timestamp;
        Samples samples;

        QString toCSVLine() const;
    };
    using SampleLines = QVector<SampleLine>;

    void clearLines();
    SampleLine captureLine();
    void applySample(const Sample &sample);

    QTimer *m_timer;
    Simulator *m_simulatir;
    Sources m_sources;
    SampleLines m_lines;
};
}
