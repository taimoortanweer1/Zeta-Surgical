/**********************************************************************************************************************
 * (C) Copyright 2021 Integrated Computer Solutions, Inc. - All rights reserved.
 **********************************************************************************************************************/

#include "simulator.hpp"

#include <QCoreApplication>
#include <QDir>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QMouseEvent>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlContext>
#include <QTimer>
#include <QElapsedTimer>
#include <QThread>
#if (QT_VERSION >= QT_VERSION_CHECK(6, 2, 0))
#include <QQmlFileSelector>
#endif

#include <greenhousetheme.h>

#include "datasampler.hpp"
#include "init.hpp"
#include "scriptsyntaxhighlighter.hpp"

#include "simulator_version.h"

namespace {
const QLatin1String INTERACTION_TYPE = QLatin1String("type");
const QLatin1String SIGNAL_INTERACTION_TYPE = QLatin1String("signal_call");
const QLatin1String PROPERTY_INTERACTION_TYPE = QLatin1String("property_change");
const QLatin1String DELAY_INTERACTION_TYPE = QLatin1String("delay");
const QLatin1String SCREENSHOT_INTERACTION_TYPE = QLatin1String("screenshot");
const QLatin1String UISTRINGREPORT_INTERACTION_TYPE = QLatin1String("uistringreport");

const QLatin1String INTERACTION_INTERFACE = QLatin1String("iface");
const QLatin1String INTERACTION_TARGET = QLatin1String("target");
const QLatin1String INTERACTION_DATA = QLatin1String("data");

const QLatin1String OBJECT_NAME = QLatin1String("objectName");
const QLatin1String OBJECT_FAVORITES = QLatin1String("favorites");
const QLatin1String MOUSE_EVENT_TAG = QLatin1String("MouseEvent");
const QLatin1String TOUCH_EVENT_TAG = QLatin1String("TouchEvent");

const QLatin1String LOCAL_X_TAG = QLatin1String("LocalX");
const QLatin1String LOCAL_Y_TAG = QLatin1String("LocalY");
const QLatin1String WINDOW_X_TAG = QLatin1String("WindowX");
const QLatin1String WINDOW_Y_TAG = QLatin1String("WindowY");

const QLatin1String MOUSE_BUTTON_TAG = QLatin1String("MouseButton");
const QLatin1String MOUSE_BUTTONS_TAG = QLatin1String("MouseButtons");

const QLatin1String SCREEN_CAPTURE_RESPONSE_TAG = QLatin1String("ScreenCaptureResponse");
const QLatin1String SCREEN_CAPTURE_TAG = QLatin1String("ScreenCapture");
const QLatin1String SCREEN_CAPTURE_TRANSFER = QLatin1String("Transfer");

const QLatin1String ACTIVE_UI_TEXT_TAG = QLatin1String("ActiveUIText");
const QLatin1String WIDTH_TAG = QLatin1String("width");
const QLatin1String HEIGHT_TAG = QLatin1String("height");
const QLatin1String CONTENT_WIDTH_TAG = QLatin1String("contentWidth");
const QLatin1String CONTENT_HEIGHT_TAG = QLatin1String("contentHeight");
const QLatin1String TEXT_TAG = QLatin1String("text");

const QLatin1String UI_TEXT_REGISTRY_RESPONSE_TAG = QLatin1String("UITextRegistryResponse");
const QLatin1String UI_TEXT_REGISTRY_TAG = QLatin1String("UITextRegistry");
const QLatin1String ACTIVE_STATE_TREE_TAG = QLatin1String("ActiveStateTree");

const QLatin1String SERVICE_ID = QLatin1String("%1 Simulator Server");
const QLatin1String SERVICE_TAG = QLatin1String("ServiceName");

const QLatin1String KNOWN_PROJECTS = QLatin1String("KNOWN_PROJECTS");
const QLatin1String PROJEC_FILE = QLatin1String("file");
const QLatin1String PROJEC_NAME = QLatin1String("name");

QString sessionStepType(const QJsonObject &step)
{
    auto it = step.constFind(MOUSE_EVENT_TAG);
    if (it != step.constEnd())
        return MOUSE_EVENT_TAG;
    it = step.constFind(TOUCH_EVENT_TAG);
    if (it != step.constEnd())
        return TOUCH_EVENT_TAG;
    return step.value(INTERACTION_TYPE).toString();
}

QVariant sessionStepValue(const QJsonObject &step)
{
    auto it = step.constFind(INTERACTION_TYPE);
    if (it != step.constEnd()) {
        if (it.value().toString().compare(DELAY_INTERACTION_TYPE) == 0) {
            return step.value(INTERACTION_DATA).toVariant();
        }
    }
    return QVariant();
}

QString sessionStepLabel(const QJsonObject &step)
{
    auto it = step.constFind(MOUSE_EVENT_TAG);
    if (it != step.constEnd()) {
        QString event;
        switch (it.value().toInt(QEvent::MouseButtonRelease)) {
        case QEvent::MouseButtonPress:
            event = QObject::tr("Press");
            break;
        case QEvent::MouseButtonDblClick:
            event = QObject::tr("Double Click");
            break;
        case QEvent::MouseMove:
            event = QObject::tr("Move");
            break;
        case QEvent::MouseButtonRelease:
        default:
            event = QObject::tr("Release");
            break;
        }

        const auto windowX = step.value(WINDOW_X_TAG).toDouble();
        const auto windowY = step.value(WINDOW_Y_TAG).toDouble();

        QString button;
        switch (step.value(MOUSE_BUTTON_TAG).toInt(Qt::LeftButton)) {
        case Qt::NoButton:
            button = QObject::tr("No Button");
            break;
        case Qt::RightButton:
            button = QObject::tr("Right");
            break;
        case Qt::MiddleButton:
            button = QObject::tr("Middle");
            break;
        case Qt::LeftButton:
        default:
            button = QObject::tr("Left");
            break;
        }
        return QStringLiteral("Mouse: %1 %2 X: %3 Y: %4").arg(button).arg(event).arg(windowX).arg(windowY);
    }
    it = step.constFind(TOUCH_EVENT_TAG);
    if (it != step.constEnd()) {
        QString event;
        switch (it.value().toInt(QEvent::TouchBegin)) {
        case QEvent::TouchBegin:
            event = QObject::tr("Begin");
            break;
        case QEvent::TouchCancel:
            event = QObject::tr("Cancel");
            break;
        case QEvent::TouchUpdate:
            event = QObject::tr("Update");
            break;
        case QEvent::TouchEnd:
        default:
            event = QObject::tr("End");
            break;
        }
        return event;
    }
    it = step.constFind(INTERACTION_TYPE);
    if (it != step.constEnd()) {
        const QString type = it.value().toString();
        if (type.compare(DELAY_INTERACTION_TYPE) == 0) {
            return QObject::tr("Pause for: %1 [ms]").arg(step.value(INTERACTION_DATA).toInt());
        } else if (type.compare(SCREENSHOT_INTERACTION_TYPE) == 0) {
            return QObject::tr("Capture screenshot: %1.").arg(step.value(INTERACTION_DATA).toString());
        } else if (type.compare(UISTRINGREPORT_INTERACTION_TYPE) == 0) {
            return QObject::tr("Request UI string report.");
        } else {
            const auto iface = step.value(INTERACTION_INTERFACE).toString();
            const auto target = step.value(INTERACTION_TARGET).toString();
            const auto data = step.value(INTERACTION_DATA);
            if (type.compare(SIGNAL_INTERACTION_TYPE) == 0) {
                const QJsonArray parameters = data.toArray();
                QStringList args;
                for (const auto &parameter : parameters)
                    args.append(parameter.toString());
                return QObject::tr("Event: %1.%2(%3)").arg(iface, target, args.join(QStringLiteral(", ")));
            } else if (type.compare(PROPERTY_INTERACTION_TYPE) == 0) {
                return QObject::tr("Set: %1.%2 to %3").arg(iface, target, data.toVariant().toString());
            }
        }
    }
    return {};
}
void installFonts(const QDir &fontsDir)
{
    const QFileInfoList fontFiles = fontsDir.entryInfoList({ QStringLiteral("*.ttf"), QStringLiteral("*.otf") });
    for (const QFileInfo &fontFile : fontFiles) {
        QFile f(fontFile.absoluteFilePath());
        if (f.open(QIODevice::ReadOnly)) {
            QFontDatabase::addApplicationFontFromData(f.readAll());
        }
    }
}

}

namespace GreenHouseRuntimeTools {

ArgumentWrapper::ArgumentWrapper(const QString &name, int type, QObject *parent)
    : QObject(parent)
    , m_name(name)
    , m_type(type)
{
    switch (type) {
    case Simulator::String:
    case Simulator::TranslatableString:
    case Simulator::ByteArray:
        m_value = QVariant::fromValue(QString());
        break;
    case Simulator::Int:
        m_value = QVariant::fromValue(0);
        break;
    case Simulator::Double:
        m_value = QVariant::fromValue(0.0);
        break;
    case Simulator::Float:
        m_value = QVariant::fromValue(0.0f);
        break;
    case Simulator::Bool:
        m_value = QVariant::fromValue(false);
        break;
    }
}

QString ArgumentWrapper::typeName() const
{
    switch (m_type) {
    case Simulator::Var:
        return QStringLiteral("var");
    case Simulator::List:
        return QStringLiteral("list");
    case Simulator::Map:
        return QStringLiteral("map");
    case Simulator::String:
    case Simulator::TranslatableString:
    case Simulator::ByteArray:
        return QStringLiteral("string");
    case Simulator::Int:
        return QStringLiteral("int");
    case Simulator::Double:
        return QStringLiteral("double");
    case Simulator::Float:
        return QStringLiteral("float");
    case Simulator::Bool:
        return QStringLiteral("bool");
    case Simulator::ObjectPtr:
        return QStringLiteral("object");
    case Simulator::Model:
        return QStringLiteral("model");
    }
    return {};
}

void ArgumentWrapper::setValue(const QVariant &val)
{
    if (m_value != val) {
        m_value = val;
        emit valueChanged();
    }
}

ScriptableObject::ScriptableObject(const QString &scriptName, const QString &folderName, QObject *parent)
    : QObject(parent)
    , m_handlerCodeFileName(QStringLiteral("simScripts/") + folderName + QStringLiteral("/") + scriptName
                            + QStringLiteral(".js"))
{
    if (!QFile::exists(QStringLiteral("simScripts/") + folderName)) {
        QDir dir;
        if (!dir.mkpath(QStringLiteral("simScripts/") + folderName))
            qWarning() << "Failed to create simulator script path for:" << folderName;
    }
    QFile handlerCodeFile(m_handlerCodeFileName);
    if (handlerCodeFile.exists() && handlerCodeFile.open(QIODevice::ReadOnly))
        setHandlerCode(QLatin1String(handlerCodeFile.readAll()));
}

void ScriptableObject::setHandlerCode(const QString &handlerCode)
{
    if (m_handlerCode == handlerCode)
        return;
    m_handlerCode = handlerCode;
    emit handlerCodeChanged();

    QFile handlerCodeFile(m_handlerCodeFileName);
    if (handlerCodeFile.open(QIODevice::WriteOnly | QIODevice::Truncate))
        handlerCodeFile.write(m_handlerCode.toLatin1());
}

void ScriptableObject::reloadHandlerCode()
{
    QFile handlerCodeFile(m_handlerCodeFileName);
    if (handlerCodeFile.open(QIODevice::ReadOnly)) {
        m_handlerCode = QString::fromLatin1(handlerCodeFile.readAll());
        emit handlerCodeChanged();
        emit syncHandlerCode();
    }
}

void ScriptableObject::installHanlder(QObject *handler)
{
    if (!m_handler.isNull())
        m_handler.data()->deleteLater();
    m_handler = handler;
}

void ScriptableObject::removeScriptFile()
{
    QFile file(m_handlerCodeFileName);
    if (file.exists())
        file.remove();
}

void ScriptableObject::clearTimers()
{
    for (auto timerPair : m_timerObjects) {
        timerPair.first->deleteLater();
        if (!timerPair.second.isNull())
            timerPair.second->deleteLater();
    }
    m_timerObjects.clear();
}

void ScriptableObject::installTimer(int interval, QObject *handler)
{
    auto timer = new QTimer(this);
    timer->setInterval(interval);
    connect(timer, &QTimer::timeout, handler,
            [handler]() -> void { QMetaObject::invokeMethod(handler, "trigger", Qt::DirectConnection); });
    timer->start();
    m_timerObjects.append(qMakePair(timer, handler));
}

void ScriptableObject::uninstallTimer(QObject *handler)
{
    int i = 0;
    for (i = 0; i < m_timerObjects.length(); ++i) {
        if (m_timerObjects.at(i).second == handler)
            break;
    }
    if (i < m_timerObjects.length()) {
        m_timerObjects.at(i).first->deleteLater();
        m_timerObjects.at(i).second->deleteLater();
        m_timerObjects.removeAt(i);
    }
}

ContextObjectEndpointWrapper::ContextObjectEndpointWrapper(const QString &name, GreenHouse::Context *ctx,
                                                           ContextObjectEndpointWrapper::CallFunc call,
                                                           ContextObjectWrapper *parent)
    : ScriptableObject(name, parent->name(), parent)
    , m_contextObjectWrapper(parent)
    , m_name(name)
    , m_callFunc(call)
    , m_ctx(ctx)
    , m_arguments()
{
}

ContextObjectWrapper *ContextObjectEndpointWrapper::contextObjectWrapper() const
{
    return m_contextObjectWrapper;
}

QString ContextObjectEndpointWrapper::arguments() const
{
    QStringList args;
    for (auto obj : m_arguments) {
        QString signature = QLatin1String("\"{name}\": {type}");
        signature.replace(QStringLiteral("{name}"), obj->name());
        signature.replace(QStringLiteral("{type}"), obj->typeName());
        args.append(signature);
    }
    return args.join(QStringLiteral(", "));
}

QList<QObject *> ContextObjectEndpointWrapper::argumentObjects() const
{
    QList<QObject *> arguments;
    for (ArgumentWrapper *arg : m_arguments)
        arguments.append(arg);
    return arguments;
}

void ContextObjectEndpointWrapper::call(const QVariantMap &args, bool silent)
{
    if (m_handler.isNull())
        return;
    QVariantMap executionArgs;
    QVariantList argList;
    for (ArgumentWrapper *arg : m_arguments) {
        auto it = args.constFind(arg->name());
        const QVariant value = it != args.constEnd() ? (*it) : arg->value();
        executionArgs.insert(arg->name(), value);
        argList << value;
    }
    QMetaObject::invokeMethod(m_handler.data(), "execute", Qt::DirectConnection, Q_ARG(QVariant, executionArgs));
    if (!silent)
        emit invoked(args);
}

void ContextObjectEndpointWrapper::callOverRPC(const QVariantMap &argMap)
{
    if (m_callFunc) {
        QVariantList args;
        for (ArgumentWrapper *arg : m_arguments) {
            auto it = argMap.constFind(arg->name());
            args.append(it != argMap.constEnd() ? (*it) : arg->value());
        }
        m_callFunc(m_ctx, args);
    }
    emit invoked(argMap);
}

ContextObjectPropertyWrapper::ContextObjectPropertyWrapper(const QString &name, int type, GreenHouse::Context *ctx,
                                                           ContextObjectPropertyWrapper::ReadFunc read,
                                                           ContextObjectPropertyWrapper::WriteFunc write,
                                                           ContextObjectWrapper *parent)
    : ScriptableObject(name + QStringLiteral("ValueChanged"), parent->name(), parent)
    , m_contextObjectWrapper(parent)
    , m_name(name)
    , m_type(type)
    , m_readFunc(read)
    , m_writeFunc(write)
    , m_ctx(ctx)
    , m_isFavorite(false)
{
    connect(this, &ContextObjectPropertyWrapper::valueChanged, this, [this]() -> void {
        if (m_handler.isNull())
            return;
        QMetaObject::invokeMethod(m_handler.data(), "execute", Qt::DirectConnection, Q_ARG(QVariant, value()));
    });
}

ContextObjectWrapper *ContextObjectPropertyWrapper::contextObjectWrapper() const
{
    return m_contextObjectWrapper;
}

void ContextObjectPropertyWrapper::setValue(const QVariant &val)
{
    if (m_writeFunc)
        m_writeFunc(m_ctx, val);
    emit valueChanged();
}

void ContextObjectPropertyWrapper::setIsFavorite(bool isFavorite)
{
    if (m_isFavorite != isFavorite) {
        m_isFavorite = isFavorite;
        emit isFavoriteChanged();
    }
}

ContextObjectWrapper::ContextObjectWrapper(const QString &name, GreenHouse::Context *ctx, ObjFunc objFunc,
                                           Simulator *parent)
    : ScriptableObject(QStringLiteral("setup"), name, parent)
    , m_name(name)
    , m_ctx(ctx)
    , m_simulator(parent)
    , m_objFunc(objFunc)
    , m_favoritesOnly(false)
{
}

void ContextObjectWrapper::setObjectNameFilter(const QString &filter)
{
    if (filter != m_objectNameFilter) {
        m_objectNameFilter = filter;
        emit objectPropertiesChanged();
    }
}

bool ContextObjectWrapper::favoritesOnly() const
{
    return m_favoritesOnly;
}

void ContextObjectWrapper::setFavorites(const QStringList &favorites)
{
    for (auto obj : m_objectProperties)
        obj->setIsFavorite(favorites.contains(obj->name()));
}

void ContextObjectWrapper::setFavoritesOnly(bool favoritesOnly)
{
    if (m_favoritesOnly != favoritesOnly) {
        m_favoritesOnly = favoritesOnly;
        emit objectPropertiesChanged();
    }
}

QList<QObject *> ContextObjectWrapper::objectMethods() const
{
    QList<QObject *> objects;
    for (auto obj : m_objectMethods)
        objects.append(obj);
    return objects;
}

ContextObjectEndpointWrapper *ContextObjectWrapper::method(const QString &name) const
{
    return m_objectMethods.value(name, nullptr);
}

QList<QObject *> ContextObjectWrapper::objectEvents() const
{
    QList<QObject *> objects;
    for (auto obj : m_objectEvents)
        objects.append(obj);
    return objects;
}

ContextObjectEndpointWrapper *ContextObjectWrapper::event(const QString &name) const
{
    return m_objectEvents.value(name, nullptr);
}

QList<QObject *> ContextObjectWrapper::objectProperties() const
{
    QList<QObject *> objects;
    for (auto obj : m_objectProperties) {
        if (!m_objectNameFilter.isEmpty() && !obj->name().contains(m_objectNameFilter, Qt::CaseInsensitive))
            continue;
        if (m_favoritesOnly && !obj->isFavorite())
            continue;
        objects.append(obj);
    }
    return objects;
}

QStringList ContextObjectWrapper::samplingObjectPropertyNames() const
{
    QStringList samplingObjectPropertyNames;
    for (auto obj : m_objectProperties) {
        switch (obj->type()) {
        case Simulator::String:
        case Simulator::TranslatableString:
            samplingObjectPropertyNames.append(obj->name() + QStringLiteral(" [String]"));
            break;
        case Simulator::ByteArray:
            samplingObjectPropertyNames.append(obj->name() + QStringLiteral(" [ByteArray]"));
            break;
        case Simulator::Int:
            samplingObjectPropertyNames.append(obj->name() + QStringLiteral(" [Int]"));
            break;
        case Simulator::Double:
            samplingObjectPropertyNames.append(obj->name() + QStringLiteral(" [Double]"));
            break;
        case Simulator::Float:
            samplingObjectPropertyNames.append(obj->name() + QStringLiteral(" [Float]"));
            break;
        case Simulator::Bool:
            samplingObjectPropertyNames.append(obj->name() + QStringLiteral(" [Bool]"));
            break;
        }
    }
    return samplingObjectPropertyNames;
}

QJsonObject ContextObjectWrapper::favoritesToJson() const
{
    QJsonArray favorites;
    for (auto obj : m_objectProperties) {
        if (!obj->isFavorite())
            continue;
        favorites.append(obj->name());
    }
    if (!favorites.isEmpty())
        return QJsonObject { { OBJECT_NAME, name() }, { OBJECT_FAVORITES, favorites } };
    return QJsonObject();
}

ContextObjectPropertyWrapper *ContextObjectWrapper::property(const QString &name) const
{
    return m_objectProperties.value(name, nullptr);
}

QObject *ContextObjectWrapper::object() const
{
    return m_objFunc(m_ctx);
}

void ContextObjectWrapper::registerMethod(ContextObjectEndpointWrapper *endpoint)
{
    if (!endpoint)
        return;
    m_objectMethods.insert(endpoint->name(), endpoint);
}

void ContextObjectWrapper::registerEvent(ContextObjectEndpointWrapper *endpoint)
{
    if (!endpoint)
        return;
    m_objectEvents.insert(endpoint->name(), endpoint);
    connect(endpoint, &ContextObjectEndpointWrapper::invoked, this,
            [this, endpoint]() -> void { m_simulator->objectTriggered(endpoint); });
}

void ContextObjectWrapper::registerProperty(ContextObjectPropertyWrapper *endpoint)
{
    if (!endpoint)
        return;
    m_objectProperties.insert(endpoint->name(), endpoint);
    connect(endpoint, &ContextObjectPropertyWrapper::valueChanged, this,
            [this, endpoint]() -> void { m_simulator->objectTriggered(endpoint); });
}

void ContextObjectWrapper::registerEnum(const QString &enumName, const QMap<QString, int> &enumValues)
{
    m_enumValueMap.insert(enumName, enumValues);
}

ScriptAction::ScriptAction(const QString &scriptName, const QString &subFolder, QObject *parent)
    : ScriptableObject(scriptName,
                       subFolder.isEmpty() ? QStringLiteral("actions") : QStringLiteral("actions/") + subFolder, parent)
    , m_name(scriptName)
    , m_subFolder(subFolder)
{
}

void ScriptAction::trigger()
{
    if (m_handler.isNull())
        return;
    QMetaObject::invokeMethod(m_handler.data(), "trigger", Qt::DirectConnection);
    qApp->processEvents();
}

bool ScriptAction::inPath(const QString &path) const
{
    QString testStr = QLatin1String("actions%1/%2.js").arg(path, name());
    bool res = m_handlerCodeFileName.endsWith(testStr);
    return res;
}

SessionModel::SessionModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void SessionModel::append(const QJsonObject &step)
{
    int elapsed = 0;
    if (!m_session.isEmpty() && m_stepTimer.isValid()) {
        elapsed = m_stepTimer.restart();
    } else {
        m_stepTimer.start();
    }
    if (elapsed > 0) {
        beginInsertRows(QModelIndex(), m_session.count(), m_session.count() + 1);
        m_session.append(QJsonObject { { INTERACTION_TYPE, DELAY_INTERACTION_TYPE }, { INTERACTION_DATA, elapsed } });
    } else {
        beginInsertRows(QModelIndex(), m_session.count(), m_session.count());
    }
    m_session.append(step);
    endInsertRows();
}

void SessionModel::clear()
{
    beginResetModel();
    m_session = QJsonArray();
    endResetModel();
}

void SessionModel::prepareForReplay()
{
    if (m_savedSession.isEmpty())
        m_savedSession = m_session;
}

void SessionModel::restoreAfterReplay()
{
    if (!m_savedSession.isEmpty()) {
        populate(m_savedSession);
        m_savedSession = QJsonArray();
    }
}

void SessionModel::populate(const QJsonArray &data)
{
    beginResetModel();
    m_session = data;
    endResetModel();
}

bool SessionModel::isEmpty() const
{
    return m_session.isEmpty();
}

QJsonValue SessionModel::takeFirst()
{
    QJsonValue val;
    if (!m_session.isEmpty()) {
        beginRemoveRows(QModelIndex(), 0, 0);
        val = m_session.takeAt(0);
        endRemoveRows();
    }
    return val;
}

void SessionModel::removeAt(int index)
{
    if (index >= 0 && index < m_session.count()) {
        beginRemoveRows(QModelIndex(), index, index);
        m_session.removeAt(index);
        endRemoveRows();
    }
}

void SessionModel::editAt(int index, const QVariant &value)
{
    if (index >= 0 && index < m_session.count()) {
        QJsonObject step = m_session.at(index).toObject();
        if (sessionStepType(step).compare(DELAY_INTERACTION_TYPE) == 0) {
            step.insert(INTERACTION_DATA, value.toInt());
            m_session.replace(index, step);
            emit dataChanged(this->index(index), this->index(index));
        }
    }
}

int SessionModel::rowCount(const QModelIndex &) const
{
    return m_session.count();
}

QVariant SessionModel::data(const QModelIndex &index, int role) const
{
    if (index.row() >= 0 && index.row() < m_session.count()) {
        const QJsonObject step = m_session.at(index.row()).toObject();
        switch (role) {
        case StepType:
            return sessionStepType(step);
        case StepValue:
            return sessionStepValue(step);
        case StepLabel:
            return sessionStepLabel(step);
        default:
            break;
        }
    }
    return QVariant();
}

QHash<int, QByteArray> SessionModel::roleNames() const
{
    return { { StepType, "stepType" }, { StepValue, "stepValue" }, { StepLabel, "stepLabel" } };
}

ActiveLayerModel::ActiveLayerModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void ActiveLayerModel::reset(const QJsonObject &uiTree)
{
    beginResetModel();
    m_data.clear();
    const QJsonObject root = uiTree.value(QStringLiteral("Root_State")).toObject();
    for (auto it = root.constBegin(); it != root.constEnd(); ++it) {
        // NOTE: We ignore all panels and backgrounds
        if (it.key().endsWith(QStringLiteral("Panel")) || it.key().endsWith(QStringLiteral("Logic"))
            || it.key().contains(QStringLiteral("Background"), Qt::CaseInsensitive)) {
            continue;
        }
        QString layerName;
        QJsonObject data;
        if (it.key().compare(QStringLiteral("MasterSurface")) == 0) {
            layerName = QLatin1String("Screens");
            data = it.value().toObject();
        } else if (it.key().compare(QStringLiteral("PopupLayer")) == 0) {
            layerName = QLatin1String("Popups");
            data = it.value().toObject();
        } else if (it.key().compare(QStringLiteral("MenuLayer")) == 0) {
            layerName = QLatin1String("Menus");
            data = it.value().toObject();
        } else {
            layerName = it.key();
            data = it.value().toObject();
        }
        if (!data.isEmpty() && !layerName.isEmpty()) {
            const auto nodeName = cleanName(data.begin().key());
            if (!nodeName.endsWith(QStringLiteral("Empty")) && !nodeName.endsWith(QStringLiteral("Hidden"))
                && nodeName.compare(QStringLiteral("NoPopup")) != 0
                && nodeName.compare(QStringLiteral("NoMenu")) != 0) {
                m_data.append(qMakePair(layerName, nodeName));
            }
        }
    }
    endResetModel();
}

int ActiveLayerModel::rowCount(const QModelIndex &) const
{
    return m_data.length();
}

QVariant ActiveLayerModel::data(const QModelIndex &index, int role) const
{
    if (index.row() >= 0 && index.row() < m_data.count()) {
        switch (role) {
        case LayerName:
            return m_data.at(index.row()).first;
        case ActiveNode:
            return m_data.at(index.row()).second;
        default:
            break;
        }
    }
    return QVariant();
}

QHash<int, QByteArray> ActiveLayerModel::roleNames() const
{
    return { { LayerName, "layerName" }, { ActiveNode, "activeNode" } };
}

QString ActiveLayerModel::cleanName(const QString &name) const
{
    auto lst = name.split(QLatin1Char('_'));
    if (lst.length() > 1)
        lst.removeLast();
    return lst.join(QLatin1Char(' '));
}

UITextModel::UITextModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void UITextModel::reset(const QJsonObject &uiTextRegistry)
{
    beginResetModel();
    m_uiTextRegistry = uiTextRegistry;
    m_selectedIds.clear();
    endResetModel();
    emit selectionChanged(m_selectedIds);
    emit overflowErrorCountChanged();
}

int UITextModel::overflowErrorCount() const
{
    int count = 0;
    for (auto it = m_uiTextRegistry.constBegin(); it != m_uiTextRegistry.constEnd(); ++it) {
        const auto array = it.value().toArray();
        for (const auto &val : array) {
            const QJsonObject item = val.toObject();
            bool overflow = item.value(WIDTH_TAG).toInt() < item.value(CONTENT_WIDTH_TAG).toInt()
                    || item.value(HEIGHT_TAG).toInt() < item.value(CONTENT_HEIGHT_TAG).toInt();
            if (overflow) {
                count++;
                break;
            }
        }
    }
    return count;
}

void UITextModel::toggleSelection(const QString &id)
{
    if (m_selectedIds.contains(id))
        m_selectedIds.removeAll(id);
    else
        m_selectedIds.append(id);
    emit selectionChanged(m_selectedIds);

    const auto changedIndex = this->index(m_uiTextRegistry.keys().indexOf(id));
    if (changedIndex.isValid())
        emit dataChanged(changedIndex, changedIndex);
}

int UITextModel::rowCount(const QModelIndex &) const
{
    return m_uiTextRegistry.count();
}

QVariant UITextModel::data(const QModelIndex &index, int role) const
{
    if (index.row() >= 0 && index.row() < m_uiTextRegistry.count()) {
        const auto key = m_uiTextRegistry.keys().at(index.row());
        switch (role) {
        case StringId:
            return key;
        case StringData: {
            const auto array = m_uiTextRegistry.value(key).toArray();
            return array.count() > 0 ? array.at(0).toObject().value(TEXT_TAG).toString() : QString();
        }
        case OverflowStatus: {
            const auto array = m_uiTextRegistry.value(key).toArray();
            bool overflow = false;
            for (const auto &val : array) {
                const QJsonObject item = val.toObject();
                overflow = item.value(WIDTH_TAG).toInt() < item.value(CONTENT_WIDTH_TAG).toInt()
                        || item.value(HEIGHT_TAG).toInt() < item.value(CONTENT_HEIGHT_TAG).toInt();
                if (overflow)
                    break;
            }
            return overflow;
        }
        case UsageCount:
            return m_uiTextRegistry.value(key).toArray().count();
        case SelectionStatus:
            return m_selectedIds.contains(key);
        default:
            break;
        }
    }
    return QVariant();
}

QHash<int, QByteArray> UITextModel::roleNames() const
{
    return { { StringId, "stringId" },
             { StringData, "stringData" },
             { UsageCount, "usageCount" },
             { OverflowStatus, "overflowStatus" },
             { SelectionStatus, "selectionStatus" } };
}

Simulator::Simulator(GreenHouse::Context *ctx, QObject *parent)
    : QObject(parent)
    , m_tabList({ tr("Backend"), tr("Action Scripts"), tr("Themes"), tr("Record and Replay"), tr("Data Sampling") })
    , m_objects()
    , m_ctx(ctx)
    , m_sessionRecordingActive(false)
    , m_sessionReplayActive(false)
    , m_serverUrl(QStringLiteral("localhost"))
    , m_serverPort(26186)
    , m_activeConnections(0)
    , m_session(new SessionModel(this))
    , m_activeLayerModel(new ActiveLayerModel(this))
    , m_uiTextModel(new UITextModel(this))
    , m_dataSampler(new DataSampler(this))
    , m_favoritesOnly(false)
{
    initialize(this, ctx);

    qmlRegisterUncreatableType<GreenHouseRuntimeTools::SessionModel>("GreenHouse.Simulator", 1, 0, "SessionModel",
                                                                     QStringLiteral("SessionModel is not creatable"));
    qmlRegisterUncreatableType<GreenHouseRuntimeTools::UITextModel>("GreenHouse.Simulator", 1, 0, "UITextModel",
                                                                    QStringLiteral("UITextModel is not creatable"));
    qmlRegisterUncreatableType<GreenHouseRuntimeTools::ArgumentWrapper>(
            "GreenHouse.Simulator", 1, 0, "ArgumentWrapper", QStringLiteral("ArgumentWrapper is not creatable"));
    qmlRegisterUncreatableType<GreenHouseRuntimeTools::ScriptableObject>(
            "GreenHouse.Simulator", 1, 0, "ScriptableObject", QStringLiteral("ScriptableObject is not creatable"));
    qmlRegisterUncreatableType<GreenHouseRuntimeTools::ContextObjectEndpointWrapper>(
            "GreenHouse.Simulator", 1, 0, "ContextObjectEndpointWrapper",
            QStringLiteral("ContextObjectEndpointWrapper is not creatable"));
    qmlRegisterUncreatableType<GreenHouseRuntimeTools::ContextObjectPropertyWrapper>(
            "GreenHouse.Simulator", 1, 0, "ContextObjectPropertyWrapper",
            QStringLiteral("ContextObjectPropertyWrapper is not creatable"));
    qmlRegisterUncreatableType<GreenHouseRuntimeTools::ContextObjectEndpointWrapper>(
            "GreenHouse.ContextObjectEndpointWrapper", 1, 0, "ContextObjectEndpointWrapper",
            QStringLiteral("ContextObjectEndpointWrapper is not creatable"));
    qmlRegisterUncreatableType<GreenHouseRuntimeTools::ContextObjectWrapper>(
            "GreenHouse.Simulator", 1, 0, "ContextObjectWrapper",
            QStringLiteral("ContextObjectWrapper is not creatable"));
    qmlRegisterUncreatableType<GreenHouseRuntimeTools::ScriptAction>("GreenHouse.Simulator", 1, 0, "ScriptAction",
                                                                     QStringLiteral("ScriptAction is not creatable"));
    qmlRegisterUncreatableType<GreenHouseRuntimeTools::DataSampler>("GreenHouse.Simulator", 1, 0, "DataSampler",
                                                                    QStringLiteral("DataSampler is not creatable"));
    qmlRegisterUncreatableType<GreenHouseRuntimeTools::Simulator>("GreenHouse.Simulator", 1, 0, "SimulatorObject",
                                                                  QStringLiteral("SimulatorObject is not creatable"));

    m_simulatorEngine = new QQmlApplicationEngine(this);
#if (QT_VERSION >= QT_VERSION_CHECK(6, 2, 0))
    QQmlFileSelector *fs = new QQmlFileSelector(m_simulatorEngine);
    fs->setExtraSelectors(QStringList { QStringLiteral("qt6") });
#endif

    const QString actionScriptFolder = QLatin1String("simScripts/actions");
    if (!QFile::exists(actionScriptFolder)) {
        QDir dir;
        if (!dir.mkpath(actionScriptFolder))
            qWarning() << "Failed to create simulator script path for: actions";
    }
    m_actionScriptFolderModel = new QFileSystemModel(this);
    m_actionScriptFolderModel->setRootPath(actionScriptFolder);
    m_actionScriptFolderModel->setFilter(QDir::Dirs | QDir::NoDotDot);
    m_actionScriptFolderModel->setReadOnly(true);
    readActionScripts();
    emit scriptsChanged();
    readFavorites();
    readKnownProjects();

    auto resumeReplay = [this]() -> void {
        if (sessionReplayActive())
            replaySession();
    };
    connect(this, &Simulator::screenCaptured, this, resumeReplay, Qt::QueuedConnection);
    connect(this, &Simulator::uiTextRegistryReceived, this, resumeReplay, Qt::QueuedConnection);

    connect(m_uiTextModel, &UITextModel::selectionChanged, this, [this](const QStringList &selection) -> void {
        QJsonArray array;
        for (const auto &id : selection) {
            array << id;
        }
        QJsonObject command({ { ACTIVE_UI_TEXT_TAG, array } });
        for (auto rpc : m_ctx->rpcServices())
            rpc->publishData(command);
    });
}

Simulator::~Simulator()
{
    for (auto process : m_processes) {
        process->disconnect();
        process->kill();
        process->waitForFinished(1000);
        delete process;
    }
    delete m_simulatorEngine;
    m_simulatorEngine = nullptr;
}

QString Simulator::version() const
{
    return QStringLiteral("v %1.%2.%3")
            .arg(SIMULATOR_MAJOR_VERSION)
            .arg(SIMULATOR_MINOR_VERSION)
            .arg(SIMULATOR_PATCH_VERSION);
}

void Simulator::setName(const QString &name)
{
    if (m_name != name) {
        m_name = name;
        emit nameChanged();
    }
}

void Simulator::setObjectNameFilter(const QString &filter)
{
    if (filter != m_objectNameFilter) {
        m_objectNameFilter = filter;
        for (auto obj : m_objects)
            obj->setObjectNameFilter(filter);
        emit objectNameFilterChanged();
    }
}

void Simulator::setActiveTab(int tab)
{
    if (m_activeTab != tab) {
        m_activeTab = tab;
        emit activeTabChanged();
    }
}

void Simulator::addExtraPage(const QString &name, const QString &pageQml)
{
    m_tabList << name;
    m_extraPageList << pageQml;
    emit extraPageListChanged();
}

QModelIndex Simulator::actionScriptRootIndex() const
{
    return m_actionScriptFolderModel ? m_actionScriptFolderModel->index(QStringLiteral("simScripts/actions"))
                                     : QModelIndex();
}

void Simulator::activateScriptPathAt(const QModelIndex &index)
{
    if (m_actionScriptFolderModel) {
        m_activeScriptPath = m_actionScriptFolderModel->filePath(index);
        m_activeScriptPath.remove(m_actionScriptFolderModel->rootDirectory().absolutePath());
        m_activeScriptPath.remove(QStringLiteral("/."));
        emit activeScriptPathChanged();
    }
}

QList<QObject *> Simulator::objects() const
{
    QList<QObject *> objects;
    for (auto obj : m_objects)
        objects.append(obj);
    return objects;
}

QStringList Simulator::objectNames() const
{
    QStringList objectNames;
    for (auto obj : m_objects)
        objectNames.append(obj->name());
    return objectNames;
}

ContextObjectWrapper *Simulator::object(int id) const
{
    return m_objects.value(m_objectNameMap.value(id, QString()), nullptr);
}

ContextObjectWrapper *Simulator::object(const QString &name) const
{
    return m_objects.value(name, nullptr);
}

QList<QObject *> Simulator::surfaceControllerObjects() const
{
    QList<QObject *> objects;
    for (auto obj : m_surfaceControllerObjects)
        objects.append(obj);
    return objects;
}

QList<QObject *> Simulator::scripts() const
{
    QList<QObject *> scripts;
    for (auto script : m_scripts)
        scripts.append(script);
    return scripts;
}

void Simulator::trigger(const QString &name, int afterMsecs)
{
    auto action = script(name);
    if (action != nullptr) {
        msleep(afterMsecs);
        action->trigger();
    }
}

void Simulator::msleep(int msecs)
{
    qApp->processEvents();
    if (msecs < 0)
        msecs = 0;
    QElapsedTimer et;
    et.start();
    while (true) {
        QThread::msleep(50);
        if (et.elapsed() >= msecs)
            break;
        qApp->processEvents();
    }
}

ScriptAction *Simulator::script(const QString &name) const
{
    return m_scripts.value(name, nullptr);
}

void Simulator::readFavorites()
{
    QFile file(QStringLiteral("simObjects/favorites.json"));
    if (!file.exists()) {
        qWarning() << "Failed to read simulator favorites";
        return;
    }
    if (file.open(QIODevice::ReadOnly)) {
        QVariantList favorites;
        QJsonParseError error;
        QJsonDocument doc = QJsonDocument::fromJson(file.readAll(), &error);
        if (error.error == QJsonParseError::NoError)
            favorites = doc.array().toVariantList();
        file.close();
        QMap<QString, QStringList> favMap;
        for (auto v : favorites) {
            QString n = v.toMap().value(OBJECT_NAME).toString();
            QVariantList fl = v.toMap().value(OBJECT_FAVORITES).toList();
            favMap[n] = QStringList();
            for (auto f : fl) {
                favMap[n] += f.toString();
            }
        }
        for (auto obj : m_objects) {
            obj->setFavorites(favMap.value(obj->name()));
        }
    }
}

void Simulator::loadProject(const QUrl &projectUrl)
{
    m_initializing = true;
    emit initializingChanged();
    if (m_generic) {
        m_dataSampler->stopSampling();
        m_dataSampler->clear();
        initialize(this, m_ctx, projectUrl.toLocalFile());
        emit objectsChanged();
        emit surfaceControllerObjectsChanged();
        for (auto script : qAsConst(m_scripts))
            script->deleteLater();
        m_scripts.clear();
        readActionScripts();
        emit scriptsChanged();

        if (!m_name.isEmpty()) {
            const QString file = projectUrl.toLocalFile();
            QJsonObject projectEntry = { { PROJEC_NAME, name() }, { PROJEC_FILE, file } };
            for (int i = m_knownProjects.count() - 1.; i >= 0; --i) {
                if (m_knownProjects.at(i).toObject().value(PROJEC_FILE).toString().compare(file) == 0) {
                    m_knownProjects.removeAt(i);
                }
            }
            m_knownProjects.prepend(projectEntry);
            emit knownProjectsChanged();

            QSettings settings;
            settings.setValue(KNOWN_PROJECTS, QJsonDocument(m_knownProjects).toJson());
            settings.sync();
        }
    }
    m_initializing = false;
    emit initializingChanged();
}

void Simulator::removeProject(int index)
{
    if (index >= 0 && index < m_knownProjects.count()) {
        m_knownProjects.removeAt(index);
        emit knownProjectsChanged();

        QSettings settings;
        settings.setValue(KNOWN_PROJECTS, QJsonDocument(m_knownProjects).toJson());
        settings.sync();
    }
}

void Simulator::saveFavorites()
{
    QJsonArray favorites;
    if (!QFile::exists(QStringLiteral("simObjects"))) {
        QDir dir;
        if (!dir.mkpath(QStringLiteral("simObjects")))
            qWarning() << "Failed to create simulator favorites path";
    }
    QFile file(QStringLiteral("simObjects/favorites.json"));
    for (auto obj : m_objects) {
        QJsonObject o = obj->favoritesToJson();
        if (o.isEmpty())
            continue;
        favorites.append(o);
    }
    if (file.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
        file.write(QJsonDocument(favorites).toJson());
    }
}

bool Simulator::addScript(const QString &name)
{
    if (name.isEmpty() || m_scripts.contains(name))
        return false;
    auto lst = name.split(QStringLiteral("/"),
#if (QT_VERSION < QT_VERSION_CHECK(5, 14, 0))
                          QString::SkipEmptyParts);
#else
                          Qt::SkipEmptyParts);
#endif
    QString scriptName = lst.takeLast();
    QString scriptSubFolder = lst.join(QStringLiteral("/"));
    auto script = new ScriptAction(scriptName, scriptSubFolder, this);
    script->setHandlerCode(QStringLiteral("console.log(\"") + scriptName + QStringLiteral("\");"));
    m_scripts.insert(scriptSubFolder.isEmpty() ? scriptName : scriptSubFolder + QStringLiteral("/") + scriptName,
                     script);
    emit scriptsChanged();
    return true;
}

bool Simulator::removeScript(const QString &name)
{
    auto it = m_scripts.find(name);
    if (it == m_scripts.end())
        return false;
    it.value()->removeScriptFile();
    it.value()->deleteLater();
    m_scripts.remove(name);
    emit scriptsChanged();
    return true;
}

QStringList Simulator::availableThemes() const
{
    return m_availableThemes;
}

void Simulator::setAvailableThemes(const QStringList &themes)
{
    m_availableThemes = themes;
    emit availableThemesChanged();
}

void Simulator::activateTheme(const QString &themeId) const
{
    m_ctx->activateTheme(themeId);
}

bool Simulator::favoritesOnly() const
{
    return m_favoritesOnly;
}

void Simulator::setFavoritesOnly(bool favoritesOnly)
{
    if (m_favoritesOnly != favoritesOnly) {
        m_favoritesOnly = favoritesOnly;
        for (auto obj : m_objects)
            obj->setFavoritesOnly(m_favoritesOnly);
        emit favoritesOnlyChanged();
    }
}

void Simulator::setGeneric(bool generic)
{
    if (m_generic != generic) {
        m_generic = generic;
        emit genericChanged();
    }
}

bool Simulator::sessionRecordingActive() const
{
    return m_sessionRecordingActive;
}

void Simulator::setSessionRecordingActive(bool sessionRecordingActive)
{
    if (m_sessionRecordingActive != sessionRecordingActive) {
        if (sessionRecordingActive)
            m_session->clear();
        m_sessionRecordingActive = sessionRecordingActive;
        emit sessionRecordingActiveChanged();
    }
}

bool Simulator::sessionReplayActive() const
{
    return m_sessionReplayActive;
}

void Simulator::setSessionReplayActive(bool sessionReplayActive)
{
    if (m_sessionReplayActive != sessionReplayActive) {
        m_sessionReplayActive = sessionReplayActive;
        emit sessionReplayActiveChanged();
    }
}

QString Simulator::serverUrl() const
{
    return m_serverUrl;
}

void Simulator::setServerUrl(const QString &url)
{
    if (m_serverUrl != url) {
        m_serverUrl = url;
        emit serverUrlChanged();
    }
}

int Simulator::serverPort() const
{
    return m_serverPort;
}

int Simulator::serverPortMin() const
{
    return 1024;
}

int Simulator::serverPortMax() const
{
    return 65535;
}

void Simulator::setServerPort(int port)
{
    if (m_serverPort != port && port >= serverPortMin() && port <= serverPortMax()) {
        m_serverPort = port;
        emit serverPortChanged();
    }
}

int Simulator::activeConnections() const
{
    return m_activeConnections;
}

void Simulator::setActiveConnections(int connections)
{
    if (m_activeConnections != connections) {
        m_activeConnections = connections;
        emit activeConnectionsChanged();
    }
}

void Simulator::objectTriggered(QObject *obj)
{
    if (!m_sessionRecordingActive)
        return;
    {
        auto signalObj = qobject_cast<ContextObjectEndpointWrapper *>(obj);
        if (signalObj) {
            QJsonArray data;
            for (auto parameter : signalObj->argumentList())
                data.append(QJsonValue::fromVariant(parameter->value()));
            m_session->append(QJsonObject { { INTERACTION_TYPE, SIGNAL_INTERACTION_TYPE },
                                            { INTERACTION_INTERFACE, signalObj->contextObjectWrapper()->name() },
                                            { INTERACTION_TARGET, signalObj->name() },
                                            { INTERACTION_DATA, data } });
        }
    }
    {
        auto propertyObj = qobject_cast<ContextObjectPropertyWrapper *>(obj);
        if (propertyObj) {
            m_session->append(QJsonObject { { INTERACTION_TYPE, PROPERTY_INTERACTION_TYPE },
                                            { INTERACTION_INTERFACE, propertyObj->contextObjectWrapper()->name() },
                                            { INTERACTION_TARGET, propertyObj->name() },
                                            { INTERACTION_DATA, QJsonValue::fromVariant(propertyObj->value()) } });
        }
    }
}

void Simulator::addSessionDelay(int ms)
{
    if (!m_sessionRecordingActive)
        return;
    m_session->append(QJsonObject { { INTERACTION_TYPE, DELAY_INTERACTION_TYPE },
                                    { INTERACTION_DATA, qMax(qMin(10000, ms), 10) } });
}

void Simulator::saveSession(const QUrl &fileUrl)
{
    if (m_session->isEmpty())
        return;
    QFile file(fileUrl.toLocalFile());
    if (file.open(QIODevice::WriteOnly | QIODevice::Truncate))
        file.write(QJsonDocument(m_session->sessionData()).toJson());
}

void Simulator::loadSession(const QUrl &fileUrl)
{
    m_session->clear();
    QFile file(fileUrl.toLocalFile());
    if (file.open(QIODevice::ReadOnly)) {
        QJsonParseError error;
        QJsonDocument doc = QJsonDocument::fromJson(file.readAll(), &error);
        if (error.error == QJsonParseError::NoError)
            m_session->populate(doc.array());
        file.close();
    }
}

void Simulator::replay(const QString &sessionName, int afterMsecs)
{
    m_session->clear();
    QFile file(QStringLiteral("simScripts/actions/") + sessionName);
    if (file.open(QIODevice::ReadOnly)) {
        QJsonParseError error;
        QJsonDocument doc = QJsonDocument::fromJson(file.readAll(), &error);
        if (error.error == QJsonParseError::NoError)
            m_session->populate(doc.array());
        file.close();
    }
    msleep(afterMsecs);
    replaySession();
    qApp->processEvents();
}

QUuid Simulator::startProcess(const QString &command, const QStringList &argList, const QString &workingDir)
{
    QProcess *process = new QProcess(this);
    QUuid uuid = QUuid::createUuid();
    connect(process, QOverload<int, QProcess::ExitStatus>::of(&QProcess::finished), this,
            [=](int exitCode, QProcess::ExitStatus exitStatus) {
                if (exitStatus == QProcess::CrashExit)
                    qWarning() << "process crashed on exit with code" << exitCode;
                if (m_processes.contains(uuid)) {
                    qDebug() << Q_FUNC_INFO << "removing process" << uuid << "from queue";
                    m_processes.remove(uuid);
                }
                qWarning() << Q_FUNC_INFO << "deleting process" << process;
                process->deleteLater();
            });
    connect(process, &QProcess::errorOccurred, [=](QProcess::ProcessError error) {
        if (error == QProcess::FailedToStart) {
            qWarning() << "process failed to start:" << command << argList;
            process->deleteLater();
        } else {
            qWarning() << "process error occurred:" << process->processId() << error;
        }
    });
    connect(process, &QProcess::started, [=]() {
        if (process->state() == QProcess::Running) {
            qDebug() << Q_FUNC_INFO << "storing process" << uuid << "in queue";
            m_processes.insert(uuid, process);
        }
    });
    process->setWorkingDirectory(workingDir);
    process->start(command, argList);
    return uuid;
}

void Simulator::stopProcess(const QUuid procId)
{
    auto process = m_processes.value(procId, nullptr);
    if (process) {
        process->terminate();
    }
}

void Simulator::killProcess(const QUuid procId)
{
    auto process = m_processes.value(procId, nullptr);
    if (process) {
        process->kill();
    }
}

void Simulator::simulateClickEvent(qreal mouseX, qreal mouseY, bool rightClick)
{
    const QJsonObject base({ { LOCAL_X_TAG, mouseX },
                             { LOCAL_Y_TAG, mouseY },
                             { MOUSE_BUTTON_TAG, static_cast<int>(rightClick ? Qt::RightButton : Qt::LeftButton) },
                             { GreenHouse::BROADCAST_TAG, true } });
    QJsonObject press = base;
    press.insert(MOUSE_EVENT_TAG, QEvent::MouseButtonPress);
    press.insert(MOUSE_BUTTONS_TAG, static_cast<int>(rightClick ? Qt::RightButton : Qt::LeftButton));
    QJsonObject release = base;
    release.insert(MOUSE_EVENT_TAG, QEvent::MouseButtonRelease);
    release.insert(MOUSE_BUTTONS_TAG, static_cast<int>(Qt::NoButton));
    for (auto rpc : m_ctx->rpcServices()) {
        rpc->publishData(press);
        rpc->publishData(release);
    }
}

void Simulator::captureScreen(const QString &saveLocation)
{
    if (m_sessionRecordingActive) {
        m_session->append(
                QJsonObject { { INTERACTION_TYPE, SCREENSHOT_INTERACTION_TYPE },
                              { INTERACTION_DATA, saveLocation.isEmpty() ? SCREEN_CAPTURE_TRANSFER : saveLocation } });
    } else {
        QJsonObject command;
        if (saveLocation.isEmpty() || saveLocation.compare(SCREEN_CAPTURE_TRANSFER) == 0) {
            if (sessionReplayActive() && !m_reportDirectory.isEmpty()) {
                QDir reportDir(m_reportDirectory);
                m_screenCaptureSaveLocation = QLatin1String("%2/%1.png")
                                                      .arg(reportDir.entryList({ QStringLiteral("*.png") }).length())
                                                      .arg(m_reportDirectory);
            } else if (m_pendingScreenshots.isEmpty()) {
                m_screenCaptureSaveLocation =
                        QStringLiteral("screenshots/%1.png")
                                .arg(QDateTime::currentDateTime().toString(QStringLiteral("dd_MM_yyyy_hh_mm_ss")));
            } else {
                m_screenCaptureSaveLocation =
                        QStringLiteral("screenshots/%1.png").arg(m_pendingScreenshots.first().name);
            }
            command = QJsonObject({ { SCREEN_CAPTURE_TAG, SCREEN_CAPTURE_TRANSFER } });
        } else {
            command = QJsonObject({ { SCREEN_CAPTURE_TAG, saveLocation } });
        }
        for (auto rpc : m_ctx->rpcServices())
            rpc->publishData(command);
    }
}

void Simulator::captureScreens()
{
    if (m_pendingScreenshots.count() > 0)
        return;
    for (const auto obj : m_surfaceControllerObjects) {
        const auto events = obj->objectEventList();
        for (const auto event : events)
            m_pendingScreenshots.append({ QStringLiteral("%1-%2").arg(obj->name(), event->name()), event });
    }
    m_totalScreenShots = pendingScreenShots();
    if (!m_pendingScreenshots.isEmpty()) {
        m_pendingScreenshots.first().endpoint->callOverRPC();
        captureScreen();
        m_pendingScreenshots.takeFirst();
    }
    emit totalScreenShotsChanged();
    emit pendingScreenShotsChanged();
}

void Simulator::requestUIStringRegistry()
{
    if (m_sessionRecordingActive) {
        m_session->append(
                QJsonObject { { INTERACTION_TYPE, UISTRINGREPORT_INTERACTION_TYPE }, { INTERACTION_DATA, true } });
    } else {
        QJsonObject command({ { UI_TEXT_REGISTRY_TAG, true } });
        for (auto rpc : m_ctx->rpcServices())
            rpc->publishData(command);
    }
}

bool Simulator::processMessagePayload(const QJsonObject &data)
{
    bool handled = false;
    auto objIt = data.constFind(MOUSE_EVENT_TAG);
    if (objIt != data.constEnd()) {
        if (m_sessionRecordingActive)
            m_session->append(data);
        handled = true;
    }
    objIt = data.constFind(TOUCH_EVENT_TAG);
    if (objIt != data.constEnd()) {
        if (m_sessionRecordingActive)
            m_session->append(data);
        handled = true;
    }
    objIt = data.constFind(SCREEN_CAPTURE_RESPONSE_TAG);
    if (objIt != data.constEnd()) {
        QByteArray screenShotData = QByteArray::fromBase64(objIt.value().toString().toLatin1());
        QFile f(m_screenCaptureSaveLocation);
        if (f.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
            f.write(screenShotData);
            emit screenCaptured(QFileInfo(f).absoluteFilePath());
        }
        if (!m_pendingScreenshots.isEmpty()) {
            m_pendingScreenshots.first().endpoint->callOverRPC();
            captureScreen();
            m_pendingScreenshots.takeFirst();
            emit pendingScreenShotsChanged();
        } else {
            m_totalScreenShots = 0;
            emit totalScreenShotsChanged();
        }
        handled = true;
    }
    objIt = data.constFind(UI_TEXT_REGISTRY_RESPONSE_TAG);
    if (objIt != data.constEnd()) {
        const QJsonObject uiTextRegistry = objIt.value().toObject();
        if (sessionReplayActive() && !m_reportDirectory.isEmpty()) {
            QDir reportDir(m_reportDirectory);
            QFile f(QStringLiteral("%2/%1.json")
                            .arg(reportDir.entryList({ QStringLiteral("*.json") }).length())
                            .arg(m_reportDirectory));
            if (f.open(QIODevice::WriteOnly | QIODevice::Truncate))
                f.write(QJsonDocument(uiTextRegistry).toJson());
        }
        emit uiTextRegistryReceived(uiTextRegistry);
        m_activeLayerModel->reset(uiTextRegistry.value(ACTIVE_STATE_TREE_TAG).toObject());
        m_uiTextModel->reset(uiTextRegistry.value(UI_TEXT_REGISTRY_TAG).toObject());
        handled = true;
    }
    objIt = data.constFind(SERVICE_TAG);
    if (objIt != data.constEnd() && generic()) {
        const QString serviceName = objIt.value().toString();
        const QString expectedServiceName = SERVICE_ID.arg(name());
        if (expectedServiceName.compare(serviceName) != 0)
            emit serviceMismatchDetected(serviceName, expectedServiceName);
        handled = true;
    }
    return handled;
}

void Simulator::init(const QUrl &mainQml)
{
    installFonts(QDir(QStringLiteral(":/assets/fonts/Roboto")));
    installFonts(QDir(QStringLiteral(":/assets/fonts/Inconsolata")));
    qmlRegisterType<ScriptSyntaxHighlighter>("GreenHouse.Simulator", 1, 0, "ScriptSyntaxHighlighter");
    qmlRegisterUncreatableType<QFileSystemModel>("GreenHouse.Simulator", 1, 0, "SimFileSystemModel",
                                                 QStringLiteral("SimFileSystemModel is not creatable"));
    m_simulatorEngine->addImportPath(QStringLiteral("qrc:/qml"));
    m_simulatorEngine->rootContext()->setContextProperty(QStringLiteral("Simulator"), this);
    m_simulatorEngine->addImportPath(QStringLiteral("qrc:/imports"));
    initQml(m_simulatorEngine);
    m_simulatorEngine->load(mainQml);
}

void Simulator::registerObject(ContextObjectWrapper *obj, int storeId)
{
    if (!obj)
        return;
    m_objects.insert(obj->name(), obj);
    m_objectNameMap.insert(storeId, obj->name());
    if (!m_initializing)
        emit objectsChanged();
}

void Simulator::registerSurfaceControllerObject(ContextObjectWrapper *obj)
{
    if (!obj)
        return;
    m_surfaceControllerObjects.insert(obj->name(), obj);
    if (!m_initializing)
        emit surfaceControllerObjectsChanged();
}

void Simulator::clearExistingObjects()
{
    if (m_objects.isEmpty())
        return;

    m_pendingScreenshots.clear();

    for (auto it = m_objects.constBegin(); it != m_objects.constEnd(); ++it)
        it.value()->deleteLater();
    m_objects.clear();
    m_objectNameMap.clear();
    emit objectsChanged();

    if (m_surfaceControllerObjects.isEmpty())
        return;

    for (auto it = m_surfaceControllerObjects.constBegin(); it != m_surfaceControllerObjects.constEnd(); ++it)
        it.value()->deleteLater();
    m_surfaceControllerObjects.clear();
    emit surfaceControllerObjectsChanged();
}

QString Simulator::uiStringReport(const QJsonObject &registry) const
{
    return QLatin1String(QJsonDocument(registry).toJson());
}

void Simulator::setStartServerFunc(StartServerFunc func)
{
    m_startServerFunc = func;
    m_backendServerRunning = false;
    emit backendServerRunningChanged();
}

void Simulator::initQml(QQmlApplicationEngine *engine)
{
    for (auto obj : qAsConst(m_objects))
        engine->rootContext()->setContextProperty(obj->name(), obj->object());
}

void Simulator::replaySession(bool reportSession)
{
    setSessionReplayActive(!m_session->isEmpty());
    if (reportSession) {
        m_reportDirectory = QLatin1String("ReplayReport_%1")
                                    .arg(QDateTime::currentDateTime().toString(QStringLiteral("dd_MM_yyyy_hh_mm_ss")));
        if (!QFile::exists(m_reportDirectory)) {
            QDir dir;
            if (!dir.mkpath(m_reportDirectory))
                qWarning() << "Failed to create simulator report path:" << m_reportDirectory;
        }
    }
    m_session->prepareForReplay();
    while (!m_session->isEmpty()) {
        QJsonObject sessionObjInteraction = m_session->takeFirst().toObject();
        sessionObjInteraction.remove(GreenHouse::RETRANSMISSION_TAG);

        auto it = sessionObjInteraction.constFind(MOUSE_EVENT_TAG);
        if (it != sessionObjInteraction.constEnd()) {
            for (auto rpc : m_ctx->rpcServices())
                rpc->publishData(sessionObjInteraction);
            continue;
        }

        it = sessionObjInteraction.constFind(TOUCH_EVENT_TAG);
        if (it != sessionObjInteraction.constEnd()) {
            for (auto rpc : m_ctx->rpcServices())
                rpc->publishData(sessionObjInteraction);
            continue;
        }

        it = sessionObjInteraction.constFind(INTERACTION_DATA);
        if (it == sessionObjInteraction.constEnd())
            continue;
        const QJsonValue data = it.value();

        it = sessionObjInteraction.constFind(INTERACTION_TYPE);
        if (it == sessionObjInteraction.constEnd())
            continue;

        const QString type = it.value().toString();
        if (type.compare(DELAY_INTERACTION_TYPE) == 0) {
            msleep(data.toInt(10));
            qApp->processEvents();
            continue;
        }

        if (type.compare(SCREENSHOT_INTERACTION_TYPE) == 0) {
            captureScreen(data.toString());
            // NOTE: Session replay to be restored once we get a response
            return;
        }

        if (type.compare(UISTRINGREPORT_INTERACTION_TYPE) == 0) {
            requestUIStringRegistry();
            // NOTE: Session replay to be restored once we get a response
            return;
        }

        it = sessionObjInteraction.constFind(INTERACTION_INTERFACE);
        if (it == sessionObjInteraction.constEnd())
            continue;

        auto iface = m_objects.value(it.value().toString(), nullptr);
        if (!iface)
            continue;

        it = sessionObjInteraction.constFind(INTERACTION_TARGET);
        if (it == sessionObjInteraction.constEnd())
            continue;

        if (type.compare(SIGNAL_INTERACTION_TYPE) == 0) {
            auto signalWrapper = iface->m_objectEvents.value(it.value().toString(), nullptr);
            if (!signalWrapper)
                continue;
            const QJsonArray parameters = data.toArray();
            const auto arguments = signalWrapper->argumentList();
            if (parameters.count() != arguments.length())
                continue;
            for (int i = 0; i < arguments.length(); ++i)
                arguments.at(i)->setValue(parameters.at(i).toVariant());
            signalWrapper->callOverRPC();
        } else if (type.compare(PROPERTY_INTERACTION_TYPE) == 0) {
            auto propertyWrapper = iface->m_objectProperties.value(it.value().toString(), nullptr);
            if (!propertyWrapper)
                continue;
            propertyWrapper->setValue(data.toVariant());
        }
    }
    setSessionReplayActive(!m_session->isEmpty());
    m_reportDirectory.clear();
    m_session->restoreAfterReplay();
    qApp->processEvents();
}

void Simulator::startBackendServer(int port)
{
    if (m_startServerFunc) {
        m_startServerFunc(port);
        m_backendServerRunning = true;
        emit backendServerRunningChanged();
    }
}

void Simulator::readActionScripts(const QString &actionScriptFolder)
{
    QDir actionsDir(QStringLiteral("simScripts/actions/") + actionScriptFolder);
    const auto actionScriptFiles = actionsDir.entryInfoList({ QStringLiteral("*.js") });
    for (const auto &actionScriptFile : actionScriptFiles) {
        m_scripts.insert(actionScriptFolder.isEmpty()
                                 ? actionScriptFile.baseName()
                                 : actionScriptFolder + QStringLiteral("/") + actionScriptFile.baseName(),
                         new ScriptAction(actionScriptFile.baseName(), actionScriptFolder, this));
    }
    const auto subFolders = actionsDir.entryInfoList(QDir::Dirs | QDir::NoDotAndDotDot);
    for (const auto &subFolder : subFolders) {
        readActionScripts(actionScriptFolder.isEmpty()
                                  ? subFolder.baseName()
                                  : actionScriptFolder + QStringLiteral("/") + subFolder.baseName());
    }
}

void Simulator::readKnownProjects()
{
    m_knownProjects = QJsonArray();
    const QSettings settings;
    const QByteArray data = settings.value(KNOWN_PROJECTS, QByteArray()).toByteArray();
    QJsonParseError err;
    const QJsonDocument doc = QJsonDocument::fromJson(data, &err);
    if (err.error == QJsonParseError::NoError) {
        if (doc.isArray()) {
            const QJsonArray sourceArray = doc.array();
            for (const QJsonValue &v : sourceArray) {
                const QJsonObject &knownProject = v.toObject();
                if (QFile::exists(knownProject.value(PROJEC_FILE).toString()))
                    m_knownProjects << knownProject;
            }
        }
    }
    emit knownProjectsChanged();
}

}
