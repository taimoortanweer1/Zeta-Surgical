#pragma once

#include <QObject>

#ifdef GREENHOUSE_GUI
#include <QQuickItem>
#include <QQmlEngine>
#endif // GREENHOUSE_GUI

class ApplicationPluginManager;

namespace GreenHouse {
class Context;
}
///
/// \brief After generating a GreenHouse flow using GreenHouse Tooling, the generated file
/// integration.cpp is used to hook up application objects to the GreenHouse context in the
/// mainWindowCreated event handler. The Integration class provides the application with an
/// application plugin manager, command line parser, main GreenHouse context, and QML engine.
///
class Integration : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(Integration)
public:
#ifdef GREENHOUSE_GUI
    explicit Integration(QQmlEngine *engine, QObject *parent = nullptr);
#endif // GREENHOUSE_GUI
    explicit Integration(QObject *parent = nullptr);
    ~Integration();

#ifdef GREENHOUSE_GUI
    Q_INVOKABLE void mainWindowCreated(QQuickItem *mainContainer, QQuickWindow *window);
#endif // GREENHOUSE_GUI
    void startExecution();

private:
    void loadPluginConfig();
#ifdef GREENHOUSE_GUI
    void connectToSimulator(QQuickWindow *window);

    QQmlEngine *m_engine = nullptr;
#else
    void connectToSimulator();
#endif // GREENHOUSE_GUI

    ApplicationPluginManager *m_applicationPluginManager = nullptr;
    GreenHouse::Context *m_context = nullptr;
};
