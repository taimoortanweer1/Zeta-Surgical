#include <QLoggingCategory>

#ifdef GREENHOUSE_GUI
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickItem>
#include <QQmlFileSelector>

#else
#include <QCoreApplication>
#endif // GREENHOUSE_GUI

#include "integration.h"
#include "QQuickVTKRenderWindow.h"

#include <appcommandlineparser.h>

int main(int argc, char *argv[])
{
#ifdef GREENHOUSE_GUI
    QGuiApplication app(argc, argv);
#else
    QCoreApplication app(argc, argv);
#endif // GREENHOUSE_GUI

    QQuickVTKRenderWindow::setupGraphicsBackend();

    app.setApplicationName(QStringLiteral("ZetaSurgical"));
    app.setApplicationVersion(QStringLiteral("1.0.0"));
    app.setOrganizationName(QStringLiteral("ICS"));
    app.setOrganizationDomain(QStringLiteral("com.ics"));

    AppCommandLineParser cmdParser(app.arguments());
    QLoggingCategory::setFilterRules(cmdParser.loggingFilters());

#ifdef GREENHOUSE_GUI
    if (cmdParser.remoteUI()) {
        Integration integration;
        integration.startExecution();
        return app.exec();
    } else {
        QQmlApplicationEngine engine;

#if (QT_VERSION >= QT_VERSION_CHECK(6, 2, 0))
        QQmlFileSelector *fs = new QQmlFileSelector(&engine);
        fs->setExtraSelectors(QStringList { QStringLiteral("qt6") });
#elif (QT_VERSION < QT_VERSION_CHECK(5, 14, 0))
        QQmlFileSelector *fs = new QQmlFileSelector(&engine);
        fs->setExtraSelectors(QStringList { QStringLiteral("legacy") });
#endif
        if (AppCommandLineParser::simulator()) {
            QQmlFileSelector *fs = new QQmlFileSelector(&engine);
            fs->setExtraSelectors(QStringList { QStringLiteral("simulator") });
        }

        engine.addImportPath(QString::fromStdString("C:\\vcpkg\\installed\\x64-windows\\lib\\qml"));

        Integration *integration = new Integration(&engine, &engine);
        engine.rootContext()->setContextProperty(QStringLiteral("Integration"), integration);
        engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
        return app.exec();
    }
#else
    Integration integration;
    integration.startExecution();
    return app.exec();
#endif // GREENHOUSE_GUI
}
