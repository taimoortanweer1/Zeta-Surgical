#include "integration.h"

#include <appcommandlineparser.h>

#include <greenhousecontext.h>
#include <greenhousetestfixture.h>
#include <greenhousetheme.h>
#include <greenhouseuxgraph.h>

#include <QQmlContext>
#include <QQuickWindow>

#include <QCoreApplication>

#include <ZetaSurgical/statemachinefactory.hpp>

Integration::Integration(QQmlEngine *engine, QObject *parent)
  : QObject(parent)
  , m_engine(engine)
{
    if (AppCommandLineParser::simulator())
        GreenHouse::Context::enableUIStringTracking();
}

Integration::~Integration()
{
    delete m_context;
}

void Integration::mainWindowCreated(QQuickItem *mainContainer, QQuickWindow *window)
{
    if (m_context) {
        // NOTE: We are dealing with a UI reload scenario, if we already have a valid context
        // instance
        m_context->setRootItem(mainContainer);
    } else {
        m_context = new GreenHouse::Context(m_engine, QStringLiteral("ZetaSurgical"),
                                            mainContainer);
        m_context->setLayoutPrefix(QStringLiteral("qrc:/ZetaSurgical/layouts/"));

        ZetaSurgical::initializeContext(m_context, true);
        new GreenHouse::UXGraph(
                m_context, QStringLiteral(":/ZetaSurgical/descriptors/UXGraph.json"),
                this);

        auto applicationSocket = new GreenHouse::WebSocketRPC(m_context);
        applicationSocket->setServiceName(QStringLiteral("ZetaSurgical Remote UX Socket"));
        // NOTE: The UX process does not implement any backend functionality
        applicationSocket->setMessageTypeBlacklist({ GreenHouse::EventInvoked,
                                                     GreenHouse::MethodInvoked });
        applicationSocket->connectTo(QUrl(
                QStringLiteral("ws://%1:%2").arg(AppCommandLineParser::backendUrl())
                                            .arg(AppCommandLineParser::backendPort())));
    }
    if (window)
        window->show();
    if (AppCommandLineParser::simulator())
        new GreenHouse::TestFixture(m_context, window);
}
