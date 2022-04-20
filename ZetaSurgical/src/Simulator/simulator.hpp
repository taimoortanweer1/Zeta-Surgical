/**********************************************************************************************************************
 * (C) Copyright 2021 Integrated Computer Solutions, Inc. - All rights reserved.
 **********************************************************************************************************************/

#pragma once

#include <functional>

#include <QElapsedTimer>
#include <QFileSystemModel>
#include <QJsonArray>
#include <QJsonObject>
#include <QMap>
#include <QObject>
#include <QPointer>
#include <QProcess>
#include <QSettings>
#include <QTimer>
#include <QUrl>
#include <QUuid>
#include <QDateTime>

#include <greenhousecontext.h>

class QQmlApplicationEngine;

namespace GreenHouseRuntimeTools {
class ContextObjectWrapper;

class ArgumentWrapper : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(ArgumentWrapper)
    Q_PROPERTY(QVariant value READ value WRITE setValue NOTIFY valueChanged)
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString typeName READ name CONSTANT)
    Q_PROPERTY(int type READ type CONSTANT)
public:
    explicit ArgumentWrapper(const QString &name, int type, QObject *parent = nullptr);

    QVariant value() const { return m_value; }
    QString name() const { return m_name; }
    QString typeName() const;
    int type() const { return m_type; }

    void setValue(const QVariant &val);

signals:
    void valueChanged();

private:
    QVariant m_value;
    QString m_name;
    int m_type;
};

class ScriptableObject : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString handlerCode READ handlerCode WRITE setHandlerCode NOTIFY handlerCodeChanged)
public:
    explicit ScriptableObject(const QString &scriptName, const QString &folderName, QObject *parent = nullptr);
    QString handlerCode() const { return m_handlerCode; }

    void setHandlerCode(const QString &handlerCode);
    Q_INVOKABLE void installHanlder(QObject *handler);

    Q_INVOKABLE void reloadHandlerCode();

    void removeScriptFile();

    Q_INVOKABLE void clearTimers();
    Q_INVOKABLE void installTimer(int interval, QObject *handler);
    Q_INVOKABLE void uninstallTimer(QObject *handler);

signals:
    void handlerCodeChanged();
    void syncHandlerCode();

protected:
    QString m_handlerCode;
    const QString m_handlerCodeFileName;
    QPointer<QObject> m_handler;
    QList<QPair<QTimer *, QPointer<QObject>>> m_timerObjects;
};

class ContextObjectEndpointWrapper : public ScriptableObject
{
    Q_OBJECT
    Q_DISABLE_COPY(ContextObjectEndpointWrapper)
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString arguments READ arguments CONSTANT)
    Q_PROPERTY(QList<QObject *> argumentObjects READ argumentObjects CONSTANT)
public:
    using CallFunc = std::function<void(GreenHouse::Context *ctx, const QVariantList &paremeters)>;
    explicit ContextObjectEndpointWrapper(const QString &name, GreenHouse::Context *ctx, CallFunc call,
                                          ContextObjectWrapper *parent);

    ContextObjectWrapper *contextObjectWrapper() const;
    QString name() const { return m_name; }
    QString arguments() const;

    QList<QObject *> argumentObjects() const;

    Q_INVOKABLE void call(const QVariantMap &args = QVariantMap(), bool silent = false);
    Q_INVOKABLE void callOverRPC(const QVariantMap &args = QVariantMap());

    void addArgument(ArgumentWrapper *arg)
    {
        if (!arg)
            return;
        m_arguments.append(arg);
    }

    const QList<ArgumentWrapper *> &argumentList() const { return m_arguments; }

signals:
    void invoked(const QVariantMap &arguments);

private:
    ContextObjectWrapper *m_contextObjectWrapper;
    QString m_name;
    CallFunc m_callFunc;
    GreenHouse::Context *m_ctx;
    QList<ArgumentWrapper *> m_arguments;
};

class ContextObjectPropertyWrapper : public ScriptableObject
{
    Q_OBJECT
    Q_DISABLE_COPY(ContextObjectPropertyWrapper)
    Q_PROPERTY(bool readOnly READ readOnly CONSTANT)
    Q_PROPERTY(QVariant value READ value WRITE setValue NOTIFY valueChanged)
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(int type READ type CONSTANT)
    Q_PROPERTY(bool isFavorite READ isFavorite WRITE setIsFavorite NOTIFY isFavoriteChanged)
public:
    using ReadFunc = std::function<QVariant(GreenHouse::Context *)>;
    using WriteFunc = std::function<void(GreenHouse::Context *, const QVariant &)>;

    explicit ContextObjectPropertyWrapper(const QString &name, int type, GreenHouse::Context *ctx, ReadFunc read,
                                          WriteFunc write, ContextObjectWrapper *parent);

    ContextObjectWrapper *contextObjectWrapper() const;
    bool readOnly() const { return m_writeFunc == nullptr; }
    QVariant value() const { return m_readFunc(m_ctx); }
    QString name() const { return m_name; }
    int type() const { return m_type; }

    void setValue(const QVariant &val);
    bool isFavorite() const { return m_isFavorite; }
    void setIsFavorite(bool isFavorite);

signals:
    void valueChanged();
    void isFavoriteChanged();

private:
    ContextObjectWrapper *m_contextObjectWrapper;
    QString m_name;
    int m_type;
    ReadFunc m_readFunc;
    WriteFunc m_writeFunc;
    GreenHouse::Context *m_ctx;
    bool m_isFavorite;
};

class Simulator;
class ContextObjectWrapper : public ScriptableObject
{
    Q_OBJECT
    Q_DISABLE_COPY(ContextObjectWrapper)
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QList<QObject *> objectMethods READ objectMethods CONSTANT)
    Q_PROPERTY(QList<QObject *> objectEvents READ objectEvents CONSTANT)
    Q_PROPERTY(QList<QObject *> objectProperties READ objectProperties NOTIFY objectPropertiesChanged)
    Q_PROPERTY(QStringList samplingObjectPropertyNames READ samplingObjectPropertyNames NOTIFY objectPropertiesChanged)
    Q_PROPERTY(QObject *object READ object CONSTANT)
public:
    using ObjFunc = std::function<QObject *(GreenHouse::Context *)>;
    explicit ContextObjectWrapper(const QString &name, GreenHouse::Context *ctx, ObjFunc objFunc, Simulator *parent);

    QString name() const { return m_name; }
    QString objectNameFilter() const { return m_objectNameFilter; }
    void setObjectNameFilter(const QString &filter);
    bool favoritesOnly() const;
    void setFavoritesOnly(bool favoritesOnly);
    void setFavorites(const QStringList &favorites);

    Simulator *simulator() const { return m_simulator; }

    QList<QObject *> objectMethods() const;
    QList<ContextObjectEndpointWrapper *> objectMethodList() const { return m_objectMethods.values(); }
    Q_INVOKABLE GreenHouseRuntimeTools::ContextObjectEndpointWrapper *method(const QString &name) const;

    QList<QObject *> objectEvents() const;
    QList<ContextObjectEndpointWrapper *> objectEventList() const { return m_objectEvents.values(); }

#ifndef _MSC_VER
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Woverloaded-virtual"
    Q_INVOKABLE GreenHouseRuntimeTools::ContextObjectEndpointWrapper *event(const QString &name) const;
#pragma GCC diagnostic pop
#else
    Q_INVOKABLE GreenHouseRuntimeTools::ContextObjectEndpointWrapper *event(const QString &name) const;
#endif

    QList<QObject *> objectProperties() const;
    QStringList samplingObjectPropertyNames() const;
    Q_INVOKABLE GreenHouseRuntimeTools::ContextObjectPropertyWrapper *property(const QString &name) const;
    QJsonObject favoritesToJson() const;

    QObject *object() const;

    void registerMethod(ContextObjectEndpointWrapper *endpoint);
    void registerEvent(ContextObjectEndpointWrapper *endpoint);
    void registerProperty(ContextObjectPropertyWrapper *endpoint);
    void registerEnum(const QString &enumName, const QMap<QString, int> &enumValues);

    QMap<QString, int> enumValues(const QString &enumName) { return m_enumValueMap.value(enumName); }

signals:
    void objectPropertiesChanged();

private:
    QString m_name;
    QString m_objectNameFilter;
    GreenHouse::Context *m_ctx;
    Simulator *m_simulator;
    ObjFunc m_objFunc;
    QMap<QString, ContextObjectEndpointWrapper *> m_objectMethods;
    QMap<QString, ContextObjectEndpointWrapper *> m_objectEvents;
    QMap<QString, ContextObjectPropertyWrapper *> m_objectProperties;
    bool m_favoritesOnly;

    QMap<QString, QMap<QString, int>> m_enumValueMap;

    friend class Simulator;
};

class ScriptAction : public ScriptableObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString subFolder READ subFolder CONSTANT)
public:
    explicit ScriptAction(const QString &scriptName, const QString &subFolder, QObject *parent = nullptr);

    QString name() const { return m_name; }
    QString subFolder() const { return m_subFolder; }

    Q_INVOKABLE void trigger();
    Q_INVOKABLE bool inPath(const QString &path) const;

private:
    QString m_name;
    QString m_subFolder;
};

class SessionModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles { StepType, StepValue, StepLabel };

    SessionModel(QObject *parent = nullptr);

    void append(const QJsonObject &step);
    void clear();
    void prepareForReplay();
    void restoreAfterReplay();
    void populate(const QJsonArray &data);
    bool isEmpty() const;

    QJsonValue takeFirst();
    QJsonArray sessionData() const { return m_session; }

public slots:
    void removeAt(int index);
    void editAt(int index, const QVariant &value);

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
    QJsonArray m_session;
    QJsonArray m_savedSession;
    QElapsedTimer m_stepTimer;
};

class ActiveLayerModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles { LayerName, ActiveNode };

    ActiveLayerModel(QObject *parent = nullptr);

    void reset(const QJsonObject &uiTree);

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
    QString cleanName(const QString &name) const;

    using LayerStatus = QPair<QString, QString>;
    QVector<LayerStatus> m_data;
};

class UITextModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int overflowErrorCount READ overflowErrorCount NOTIFY overflowErrorCountChanged)

public:
    enum Roles { StringId, StringData, UsageCount, OverflowStatus, SelectionStatus };

    UITextModel(QObject *parent = nullptr);
    void reset(const QJsonObject &uiTextRegistry);

    int overflowErrorCount() const;

public slots:
    void toggleSelection(const QString &id);

signals:
    void selectionChanged(const QStringList &selection);
    void overflowErrorCountChanged();

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
    QJsonObject m_uiTextRegistry;
    QStringList m_selectedIds;
};

class DataSampler;
class Simulator : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(Simulator)

    Q_PROPERTY(QString name READ name NOTIFY nameChanged)
    Q_PROPERTY(QString version READ version CONSTANT)
    Q_PROPERTY(QStringList tabList READ tabList NOTIFY extraPageListChanged)
    Q_PROPERTY(QStringList extraPageList READ extraPageList NOTIFY extraPageListChanged)
    Q_PROPERTY(int activeTab READ activeTab WRITE setActiveTab NOTIFY activeTabChanged)

    Q_PROPERTY(QFileSystemModel *actionScriptFolderModel READ actionScriptFolderModel CONSTANT)
    Q_PROPERTY(QModelIndex actionScriptRootIndex READ actionScriptRootIndex CONSTANT)
    Q_PROPERTY(QString activeScriptPath READ activeScriptPath NOTIFY activeScriptPathChanged)

    Q_PROPERTY(QList<QObject *> objects READ objects NOTIFY objectsChanged)
    Q_PROPERTY(QStringList objectNames READ objectNames NOTIFY objectsChanged)
    Q_PROPERTY(QList<QObject *> surfaceControllerObjects READ surfaceControllerObjects NOTIFY
                       surfaceControllerObjectsChanged)
    Q_PROPERTY(QList<QObject *> scripts READ scripts NOTIFY scriptsChanged)
    Q_PROPERTY(QStringList availableThemes READ availableThemes NOTIFY availableThemesChanged)

    Q_PROPERTY(bool sessionRecordingActive READ sessionRecordingActive WRITE setSessionRecordingActive NOTIFY
                       sessionRecordingActiveChanged)
    Q_PROPERTY(bool sessionReplayActive READ sessionReplayActive NOTIFY sessionReplayActiveChanged)
    Q_PROPERTY(GreenHouseRuntimeTools::SessionModel *sessionModel READ sessionModel CONSTANT)

    Q_PROPERTY(GreenHouseRuntimeTools::ActiveLayerModel *activeLayerModel READ activeLayerModel CONSTANT)
    Q_PROPERTY(GreenHouseRuntimeTools::UITextModel *uiTextModel READ uiTextModel CONSTANT)

    Q_PROPERTY(GreenHouseRuntimeTools::DataSampler *dataSampler READ dataSampler CONSTANT)

    Q_PROPERTY(QString serverUrl READ serverUrl WRITE setServerUrl NOTIFY serverUrlChanged)
    Q_PROPERTY(int serverPort READ serverPort WRITE setServerPort NOTIFY serverPortChanged)
    Q_PROPERTY(int activeConnections READ activeConnections NOTIFY activeConnectionsChanged)
    Q_PROPERTY(int serverPortMin READ serverPortMin CONSTANT)
    Q_PROPERTY(int serverPortMax READ serverPortMax CONSTANT)
    Q_PROPERTY(QString objectNameFilter READ objectNameFilter WRITE setObjectNameFilter NOTIFY objectNameFilterChanged)
    Q_PROPERTY(bool favoritesOnly READ favoritesOnly WRITE setFavoritesOnly NOTIFY favoritesOnlyChanged)
    Q_PROPERTY(bool backendServerRunning READ backendServerRunning NOTIFY backendServerRunningChanged)

    Q_PROPERTY(bool generic READ generic NOTIFY genericChanged)
    Q_PROPERTY(bool initializing READ initializing NOTIFY initializingChanged)
    Q_PROPERTY(QJsonArray knownProjects READ knownProjects NOTIFY knownProjectsChanged)

    Q_PROPERTY(int pendingScreenShots READ pendingScreenShots NOTIFY pendingScreenShotsChanged)
    Q_PROPERTY(int totalScreenShots READ totalScreenShots NOTIFY totalScreenShotsChanged)

public:
    enum ArgumenType {
        Var,
        List,
        Map,
        String,
        Int,
        Double,
        Float,
        Bool,
        ObjectPtr,
        Model,
        TranslatableString,
        ByteArray,
        UserType = 128
    };
    Q_ENUM(ArgumenType)
    explicit Simulator(GreenHouse::Context *ctx, QObject *parent = nullptr);
    ~Simulator();

    QString name() const { return m_name; }
    QString version() const;
    void setName(const QString &name);
    QStringList tabList() const { return m_tabList; }
    QStringList extraPageList() const { return m_extraPageList; }

    int activeTab() const { return m_activeTab; }
    void setActiveTab(int tab);

    void addExtraPage(const QString &name, const QString &pageQml);

    QFileSystemModel *actionScriptFolderModel() const { return m_actionScriptFolderModel; }
    QModelIndex actionScriptRootIndex() const;
    Q_INVOKABLE void activateScriptPathAt(const QModelIndex &index);
    QString activeScriptPath() const { return m_activeScriptPath; }

    QList<QObject *> objects() const;
    QStringList objectNames() const;
    ContextObjectWrapper *object(int id) const;
    Q_INVOKABLE GreenHouseRuntimeTools::ContextObjectWrapper *object(const QString &name) const;

    QList<QObject *> surfaceControllerObjects() const;

    QString objectNameFilter() const { return m_objectNameFilter; }
    void setObjectNameFilter(const QString &filter);

    QList<QObject *> scripts() const;
    Q_INVOKABLE GreenHouseRuntimeTools::ScriptAction *script(const QString &name) const;
    Q_INVOKABLE void msleep(int msecs);
    Q_INVOKABLE void trigger(const QString &name, int afterMsecs = 0);
    Q_INVOKABLE bool addScript(const QString &name);
    Q_INVOKABLE bool removeScript(const QString &name);

    QStringList availableThemes() const;
    void setAvailableThemes(const QStringList &themes);

    Q_INVOKABLE void activateTheme(const QString &themeId) const;

    bool sessionRecordingActive() const;
    void setSessionRecordingActive(bool sessionRecordingActive);

    bool sessionReplayActive() const;
    GreenHouseRuntimeTools::SessionModel *sessionModel() const { return m_session; }
    void setSessionReplayActive(bool sessionReplayActive);

    GreenHouseRuntimeTools::ActiveLayerModel *activeLayerModel() const { return m_activeLayerModel; }
    GreenHouseRuntimeTools::UITextModel *uiTextModel() const { return m_uiTextModel; }

    GreenHouseRuntimeTools::DataSampler *dataSampler() const { return m_dataSampler; }

    bool favoritesOnly() const;
    void setFavoritesOnly(bool favoritesOnly);

    bool generic() const { return m_generic; }
    void setGeneric(bool generic);

    bool initializing() const { return m_initializing; }

    QJsonArray knownProjects() const { return m_knownProjects; }

    int pendingScreenShots() const { return m_pendingScreenshots.count(); }
    int totalScreenShots() const { return m_totalScreenShots; }

    QString serverUrl() const;
    void setServerUrl(const QString &url);
    int serverPort() const;
    int serverPortMin() const;
    int serverPortMax() const;
    void setServerPort(int port);

    int activeConnections() const;
    void setActiveConnections(int connections);

    Q_INVOKABLE void objectTriggered(QObject *obj);
    Q_INVOKABLE void addSessionDelay(int ms);
    Q_INVOKABLE void saveSession(const QUrl &fileUrl);
    Q_INVOKABLE void loadSession(const QUrl &fileUrl);
    Q_INVOKABLE void replay(const QString &sessionName, int afterMsecs = 0);

    Q_INVOKABLE QUuid startProcess(const QString &command, const QStringList &argList = {},
                                   const QString &workingDir = {});
    Q_INVOKABLE void stopProcess(const QUuid procId);
    Q_INVOKABLE void killProcess(const QUuid procId);

    Q_INVOKABLE void simulateClickEvent(qreal mouseX, qreal mouseY, bool rightClick = false);

    Q_INVOKABLE void captureScreen(const QString &saveLocation = QString());
    Q_INVOKABLE void captureScreens();

    Q_INVOKABLE void requestUIStringRegistry();

    QQmlApplicationEngine *engine() const { return m_simulatorEngine; }

    bool processMessagePayload(const QJsonObject &data);
    void init(const QUrl &mainQml);

    void registerObject(ContextObjectWrapper *obj, int storeId);
    void registerSurfaceControllerObject(ContextObjectWrapper *obj);
    void clearExistingObjects();

    Q_INVOKABLE QString uiStringReport(const QJsonObject &registry) const;

    using StartServerFunc = std::function<void(int)>;
    void setStartServerFunc(StartServerFunc func);
    bool backendServerRunning() const { return m_backendServerRunning; }

public slots:
    void saveFavorites();
    void readFavorites();
    void loadProject(const QUrl &projectUrl);
    void removeProject(int index);
    void replaySession(bool reportSession = false);
    void startBackendServer(int port);

signals:
    void nameChanged();
    void activeTabChanged();
    void activeScriptPathChanged();
    void extraPageListChanged();
    void sessionRecordingActiveChanged();
    void favoritesOnlyChanged();
    void sessionReplayActiveChanged();
    void serverUrlChanged();
    void serverPortChanged();
    void activeConnectionsChanged();
    void availableThemesChanged();
    void objectsChanged();
    void surfaceControllerObjectsChanged();
    void scriptsChanged();
    void objectNameFilterChanged();
    void genericChanged();
    void initializingChanged();
    void knownProjectsChanged();
    void pendingScreenShotsChanged();
    void totalScreenShotsChanged();
    void screenCaptured(const QString &file);
    void uiTextRegistryReceived(const QJsonObject &registry);
    void serviceMismatchDetected(const QString &serviceName, const QString &expectedServiceName);
    void backendServerRunningChanged();

protected:
    virtual void initQml(QQmlApplicationEngine *engine);

private:
    void readActionScripts(const QString &actionScriptFolder = QString());
    void readKnownProjects();

    QString m_name;
    QStringList m_tabList;
    QStringList m_extraPageList;
    int m_activeTab = 0;

    QFileSystemModel *m_actionScriptFolderModel;
    QString m_activeScriptPath;
    QString m_objectNameFilter;

    QMap<QString, ContextObjectWrapper *> m_objects;
    QMap<QString, ContextObjectWrapper *> m_surfaceControllerObjects;
    struct ScreenShotData {
        QString name;
        ContextObjectEndpointWrapper *endpoint;
    };
    QList<ScreenShotData> m_pendingScreenshots;
    int m_totalScreenShots = 0;
    QMap<QString, ScriptAction *> m_scripts;
    QMap<int, QString> m_objectNameMap;
    QMap<QUuid, QProcess *> m_processes;
    GreenHouse::Context *m_ctx;
    QQmlApplicationEngine *m_simulatorEngine = nullptr;

    bool m_sessionRecordingActive;
    bool m_sessionReplayActive;
    QString m_serverUrl;
    int m_serverPort;
    int m_activeConnections;
    SessionModel *m_session = nullptr;
    ActiveLayerModel *m_activeLayerModel = nullptr;
    UITextModel *m_uiTextModel = nullptr;
    DataSampler *m_dataSampler = nullptr;
    QStringList m_availableThemes;
    bool m_favoritesOnly = false;
    bool m_generic = true;
    bool m_initializing = false;
    QJsonArray m_knownProjects;

    QString m_screenCaptureSaveLocation;
    QString m_reportDirectory;

    StartServerFunc m_startServerFunc = nullptr;
    bool m_backendServerRunning = false;
};
}
