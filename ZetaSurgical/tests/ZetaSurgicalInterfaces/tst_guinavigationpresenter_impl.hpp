//--------------------------------------------------------------------------------------------------
// Generated using GreenHouse Modeling Library v 1.7.4
// From: ZetaSurgical GUINavigationPresenter Interface
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

#include <ZetaSurgical/guinavigationpresenter.hpp>

using namespace testing;

class GUINavigationPresenterImplTestRpc : public GreenHouse::RPCServiceInterface
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

class GUINavigationPresenterInterfaceImplTest : public Test
{
    // Test interface
protected:
    void SetUp();
    void TearDown();

    ZetaSurgical::GUINavigationPresenter *iface;
    ApplicationPluginManager *m_applicationPluginManager;
    GUINavigationPresenterImplTestRpc *m_rpc;
    GreenHouse::Context m_ctx;
};

void GUINavigationPresenterInterfaceImplTest ::SetUp()
{
    m_rpc = new GUINavigationPresenterImplTestRpc(&m_ctx);
    QDir pluginDir;
    pluginDir = QDir(qApp->applicationDirPath());
    pluginDir.cdUp();
    pluginDir.cdUp();
    pluginDir.cd(QStringLiteral("plugins"));
    m_applicationPluginManager = new ApplicationPluginManager(pluginDir.absoluteFilePath(QStringLiteral("config.json")),
                                                              pluginDir.absolutePath());
    if (m_applicationPluginManager)
        m_applicationPluginManager->inject(&m_ctx);
    iface = m_ctx.get<ZetaSurgical::GUINavigationPresenter>();
    if (!iface) {
        iface = new ZetaSurgical::GUINavigationPresenter;
        m_ctx.store(iface);
    }
    m_ctx.startExecution();
}

void GUINavigationPresenterInterfaceImplTest ::TearDown()
{
    delete m_applicationPluginManager;
}

TEST_F(GUINavigationPresenterInterfaceImplTest, onScreenRequested)
{

    iface->onScreenRequested(-1);
}

TEST_F(GUINavigationPresenterInterfaceImplTest, tabIndex_Imp)
{
    auto oldValue = iface->tabIndex();
    auto newValue = std::numeric_limits<int>::max();

    bool changeSignalEmitted = false;
    QObject::connect(iface, &ZetaSurgical::GUINavigationPresenter::tabIndexChanged,
                     [&]() { changeSignalEmitted = true; });

    iface->setTabIndex(newValue);
    ASSERT_TRUE(changeSignalEmitted);
    ASSERT_NE(iface->tabIndex(), oldValue);
    ASSERT_EQ(iface->tabIndex(), newValue);
}

TEST_F(GUINavigationPresenterInterfaceImplTest, backButtonIsVisible_Imp)
{
    auto oldValue = iface->backButtonIsVisible();
    auto newValue = !oldValue;

    bool changeSignalEmitted = false;
    QObject::connect(iface, &ZetaSurgical::GUINavigationPresenter::backButtonIsVisibleChanged,
                     [&]() { changeSignalEmitted = true; });

    iface->setBackButtonIsVisible(newValue);
    ASSERT_TRUE(changeSignalEmitted);
    ASSERT_NE(iface->backButtonIsVisible(), oldValue);
    ASSERT_EQ(iface->backButtonIsVisible(), newValue);
}

TEST_F(GUINavigationPresenterInterfaceImplTest, uploadCompleted_Imp)
{
    auto oldValue = iface->uploadCompleted();
    auto newValue = !oldValue;

    bool changeSignalEmitted = false;
    QObject::connect(iface, &ZetaSurgical::GUINavigationPresenter::uploadCompletedChanged,
                     [&]() { changeSignalEmitted = true; });

    iface->setUploadCompleted(newValue);
    ASSERT_TRUE(changeSignalEmitted);
    ASSERT_NE(iface->uploadCompleted(), oldValue);
    ASSERT_EQ(iface->uploadCompleted(), newValue);
}

TEST_F(GUINavigationPresenterInterfaceImplTest, segmentationCompleted_Imp)
{
    auto oldValue = iface->segmentationCompleted();
    auto newValue = !oldValue;

    bool changeSignalEmitted = false;
    QObject::connect(iface, &ZetaSurgical::GUINavigationPresenter::segmentationCompletedChanged,
                     [&]() { changeSignalEmitted = true; });

    iface->setSegmentationCompleted(newValue);
    ASSERT_TRUE(changeSignalEmitted);
    ASSERT_NE(iface->segmentationCompleted(), oldValue);
    ASSERT_EQ(iface->segmentationCompleted(), newValue);
}

TEST_F(GUINavigationPresenterInterfaceImplTest, planningCompleted_Imp)
{
    auto oldValue = iface->planningCompleted();
    auto newValue = !oldValue;

    bool changeSignalEmitted = false;
    QObject::connect(iface, &ZetaSurgical::GUINavigationPresenter::planningCompletedChanged,
                     [&]() { changeSignalEmitted = true; });

    iface->setPlanningCompleted(newValue);
    ASSERT_TRUE(changeSignalEmitted);
    ASSERT_NE(iface->planningCompleted(), oldValue);
    ASSERT_EQ(iface->planningCompleted(), newValue);
}

TEST_F(GUINavigationPresenterInterfaceImplTest, positioningCompleted_Imp)
{
    auto oldValue = iface->positioningCompleted();
    auto newValue = !oldValue;

    bool changeSignalEmitted = false;
    QObject::connect(iface, &ZetaSurgical::GUINavigationPresenter::positioningCompletedChanged,
                     [&]() { changeSignalEmitted = true; });

    iface->setPositioningCompleted(newValue);
    ASSERT_TRUE(changeSignalEmitted);
    ASSERT_NE(iface->positioningCompleted(), oldValue);
    ASSERT_EQ(iface->positioningCompleted(), newValue);
}

TEST_F(GUINavigationPresenterInterfaceImplTest, navigationCompleted_Imp)
{
    auto oldValue = iface->navigationCompleted();
    auto newValue = !oldValue;

    bool changeSignalEmitted = false;
    QObject::connect(iface, &ZetaSurgical::GUINavigationPresenter::navigationCompletedChanged,
                     [&]() { changeSignalEmitted = true; });

    iface->setNavigationCompleted(newValue);
    ASSERT_TRUE(changeSignalEmitted);
    ASSERT_NE(iface->navigationCompleted(), oldValue);
    ASSERT_EQ(iface->navigationCompleted(), newValue);
}
