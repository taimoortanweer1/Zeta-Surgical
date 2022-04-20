#include <QCoreApplication>

#include <greenhousecontext.h>

#include <appcommandlineparser.h>
#include <applicationpluginmanager.h>

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    app.setApplicationName(QStringLiteral("ZetaSurgical_Backend"));
    app.setApplicationVersion(QStringLiteral("1.0.0"));
    app.setOrganizationName(QStringLiteral("ICS"));
    app.setOrganizationDomain(QStringLiteral("com.ics"));

    AppCommandLineParser cmdParser(app.arguments());
    QLoggingCategory::setFilterRules(cmdParser.loggingFilters());

    QDir pluginDir;
    if (cmdParser.pluginPath().isEmpty()) {
        pluginDir = QDir(qApp->applicationDirPath());
        if (!QFile::exists(pluginDir.absoluteFilePath(QStringLiteral("plugins"))))
            pluginDir.cdUp();
        pluginDir.cd(QStringLiteral("plugins"));
    } else {
        pluginDir = QDir(cmdParser.pluginPath());
    }
    if (!pluginDir.exists()) {
        qCritical() << "Failed to find the application's plugins folder";
        return -1;
    }

    if (cmdParser.simulator())
        GreenHouse::Context::enableUIStringTracking();

    ApplicationPluginManager applicationPluginManager(pluginDir.absoluteFilePath(QStringLiteral("config.json")),
                                                      pluginDir.absolutePath());
    GreenHouse::Context ctx;
    applicationPluginManager.inject(&ctx);

    auto backendServer = new GreenHouse::WebSocketRPCServer(&ctx, {}, QWebSocketServer::NonSecureMode);
    backendServer->setServiceName(QStringLiteral("ZetaSurgical Backend Server"));
    backendServer->listen(QHostAddress::Any, quint16(cmdParser.backendPort()));

    return app.exec();
}
