//--------------------------------------------------------------------------------------------------
// Generated using GreenHouse Modeling Library v 1.7.4
// From: ZetaSurgical PositioningPresenter Interface
// Feel free to edit this file as it is generated only once and will not be overritten
// the next time the application flow is regenerated.
//--------------------------------------------------------------------------------------------------
#pragma once

#include <limits>

#include <QCoreApplication>

#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>

#include <QJsonDocument>

#include <applicationpluginmanager.h>

#include <ZetaSurgical/positioningpresenter.hpp>

using namespace testing;

class PositioningPresenterImplTestRpc : public GreenHouse::RPCServiceInterface
{
public:
    using GreenHouse::RPCServiceInterface::RPCServiceInterface;

    QList<QJsonObject> messages;

    // GreenHouse::RPCServiceInterface interface
protected:
    void sendPayload(const QByteArray &data) override
    {
        QJsonParseError err;
        QJsonDocument doc = QJsonDocument::fromJson(data, &err);
        if (err.error == QJsonParseError::NoError) {
            messages.append(doc.object());
        }
    }
};

class PositioningPresenterInterfaceImplTest : public Test
{
    // Test interface
protected:
    void SetUp();
    void TearDown();

    ZetaSurgical::PositioningPresenter *iface;
    ApplicationPluginManager *m_applicationPluginManager;
    PositioningPresenterImplTestRpc *m_rpc;
    GreenHouse::Context m_ctx;
};

void PositioningPresenterInterfaceImplTest ::SetUp()
{
    m_rpc = new PositioningPresenterImplTestRpc(&m_ctx);
    QDir pluginDir;
    pluginDir = QDir(qApp->applicationDirPath());
    pluginDir.cdUp();
    pluginDir.cdUp();
    pluginDir.cd(QStringLiteral("plugins"));
    m_applicationPluginManager = new ApplicationPluginManager(pluginDir.absoluteFilePath(QStringLiteral("config.json")),
                                                              pluginDir.absolutePath());
    if (m_applicationPluginManager)
        m_applicationPluginManager->inject(&m_ctx);
    iface = m_ctx.get<ZetaSurgical::PositioningPresenter>();
    if (!iface) {
        iface = new ZetaSurgical::PositioningPresenter;
        m_ctx.store(iface);
    }
    m_ctx.startExecution();
}

void PositioningPresenterInterfaceImplTest ::TearDown()
{
    delete m_applicationPluginManager;
}

TEST_F(PositioningPresenterInterfaceImplTest, onPositioningStarted)
{

    iface->onPositioningStarted();
}

TEST_F(PositioningPresenterInterfaceImplTest, onPositioningFinished)
{

    iface->onPositioningFinished();
}
