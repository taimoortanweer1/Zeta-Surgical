#include "integration.h"

#include <appcommandlineparser.h>
#include <applicationpluginmanager.h>

#include <greenhousecontext.h>
#include <greenhousetestfixture.h>
#include <greenhousetheme.h>

#include <QQmlContext>
#include <QQuickWindow>

#include <QCoreApplication>

#include <ZetaSurgical/statemachinefactory.hpp>
#include <ZetaSurgical/remoteiteminterfaces.hpp>

Integration::Integration(QQmlEngine *engine, QObject *parent) :
    QObject(parent)
   , m_engine(engine)
{
    if (AppCommandLineParser::simulator())
        GreenHouse::Context::enableUIStringTracking();
    loadPluginConfig();
}

Integration::Integration(QObject *parent) :
    QObject(parent)
{
    if (AppCommandLineParser::simulator())
        GreenHouse::Context::enableUIStringTracking();
    loadPluginConfig();
}

Integration::~Integration()
{
    delete m_context;
}

void Integration::mainWindowCreated(QQuickItem *mainContainer, QQuickWindow *window)
{
    if (m_context) {
        // NOTE: We are dealing with a UI reload scenario, if we already have a valid context instance
        m_context->setRootItem(mainContainer);
    } else {
        m_context = new GreenHouse::Context(m_engine, QStringLiteral("ZetaSurgical"), mainContainer);

        if (m_applicationPluginManager)
            m_applicationPluginManager->inject(m_context);

        m_context->setLayoutPrefix(QStringLiteral("qrc:/ZetaSurgical/layouts/"));

        ZetaSurgical::StateMachineFactory factory;
        m_context->startExecution(factory, this);

        connectToSimulator(window);
    }
    if (window)
        window->show();
}

void Integration::startExecution()
{
    if (!m_context) {
        m_context = new GreenHouse::Context();

        if (m_applicationPluginManager)
            m_applicationPluginManager->inject(m_context);

        ZetaSurgical::initializeRemoteUXInterfaces(new GreenHouse::RemoteUXInterfaceManager(m_context, this));
        auto remoteUIServer = new GreenHouse::WebSocketRPCServer(m_context, {}, QWebSocketServer::NonSecureMode);
        remoteUIServer->listen(QHostAddress::Any, AppCommandLineParser::backendPort());
        // NOTE: The UX process is not allowed to access any backend features directly
        remoteUIServer->setMessageTypeBlacklist({ GreenHouse::PropertyValueSet,
                                                  GreenHouse::EventInvoked,
                                                  GreenHouse::MethodInvoked,
                                                  GreenHouse::ModelPopulated,
                                                  GreenHouse::ModelRowRemoved,
                                                  GreenHouse::ModelRowPrepended,
                                                  GreenHouse::ModelRowAppended,
                                                  GreenHouse::ModelRowDataSet,
                                                  GreenHouse::ModelRowRoleSet });
        remoteUIServer->setServiceName(QStringLiteral("ZetaSurgical Remote UX Server"));
        ZetaSurgical::StateMachineFactory factory;


        m_context->startExecution(factory, this);

        connectToSimulator(nullptr);
    }
}

void Integration::loadPluginConfig()
{
    QDir pluginDir;
    if (AppCommandLineParser::pluginPath().isEmpty()) {
        pluginDir = QDir(qApp->applicationDirPath());
        if (!QFile::exists(pluginDir.absoluteFilePath(QStringLiteral("plugins"))))
            pluginDir.cdUp();
        pluginDir.cd(QStringLiteral("plugins"));
    } else {
        pluginDir = QDir(AppCommandLineParser::pluginPath());
    }
    if (pluginDir.exists()) {
        m_applicationPluginManager = new ApplicationPluginManager(
                pluginDir.absoluteFilePath(QStringLiteral("config.json")), pluginDir.absolutePath(), this);
    }
}

void Integration::connectToSimulator(QQuickWindow *window)
{
    if (!AppCommandLineParser::simulator())
        return;
    auto appServer = new GreenHouse::WebSocketRPCServer(m_context, {}, QWebSocketServer::NonSecureMode);
    appServer->setServiceName(QStringLiteral("ZetaSurgical Simulator Server"));
    appServer->listen(QHostAddress::Any, AppCommandLineParser::simulatorPort());
#ifdef GREENHOUSE_GUI
    if (window)
        new GreenHouse::TestFixture(m_context, window);
#else
    Q_UNUSED(window)
#endif // GREENHOUSE_GUI
}
