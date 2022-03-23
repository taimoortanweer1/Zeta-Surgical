#include <QLoggingCategory>

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickItem>
#include <QQmlFileSelector>

#include "integration.h"

#include <appcommandlineparser.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setApplicationName(QStringLiteral("ZetaSurgical"));
    app.setApplicationVersion(QStringLiteral("1.0.0"));
    app.setOrganizationName(QStringLiteral("ICS"));
    app.setOrganizationDomain(QStringLiteral("com.ics"));

    AppCommandLineParser cmdParser(app.arguments());
    QLoggingCategory::setFilterRules(cmdParser.loggingFilters());

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

    Integration *integration = new Integration(&engine, &engine);
    engine.rootContext()->setContextProperty(QStringLiteral("Integration"), integration);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
