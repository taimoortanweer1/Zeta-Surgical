/**********************************************************************************************************************
 * (C) Copyright 2021 Integrated Computer Solutions, Inc. - All rights reserved.
 **********************************************************************************************************************/

#include <QApplication>
#include <QIcon>

#include <greenhousecontext.h>

#include "simulator.hpp"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    app.setApplicationName(QStringLiteral("GreenHouse Simulator"));
    app.setOrganizationName(QStringLiteral("ICS"));
    app.setOrganizationDomain(QStringLiteral("com.ics"));
    app.setWindowIcon(QIcon(QStringLiteral(":/icons/Simulator.png")));

    GreenHouse::Context ctx;
    GreenHouseRuntimeTools::Simulator simulator(&ctx);
    app.setApplicationVersion(simulator.version());

    simulator.init(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    simulator.setServerUrl(QStringLiteral("localhost"));
    simulator.setServerPort(26186);

    GreenHouse::RPCServiceInterface *interface = nullptr;
    auto simulatorSocket = new GreenHouse::WebSocketRPC(&ctx);
    simulatorSocket->setServiceName(QStringLiteral("GreenHouse Simulator Socket"));
    if (!simulator.generic()) {
        simulatorSocket->connectTo(
                QUrl(QStringLiteral("ws://%1:%2").arg(simulator.serverUrl()).arg(simulator.serverPort())));
    }

    auto reconnect = [&]() -> void {
        if (simulator.generic() || !simulator.name().isEmpty()) {
            simulatorSocket->connectTo(
                    QUrl(QStringLiteral("ws://%1:%2").arg(simulator.serverUrl()).arg(simulator.serverPort())));
        }
    };
    QObject::connect(&simulator, &GreenHouseRuntimeTools::Simulator::serverUrlChanged, simulatorSocket, reconnect);
    QObject::connect(&simulator, &GreenHouseRuntimeTools::Simulator::serverPortChanged, simulatorSocket, reconnect);
    QObject::connect(&simulator, &GreenHouseRuntimeTools::Simulator::nameChanged, simulatorSocket, reconnect);
    QObject::connect(&simulator, &GreenHouseRuntimeTools::Simulator::serviceMismatchDetected, simulatorSocket,
                     &GreenHouse::WebSocketRPC::disconnectFrom);

    interface = simulatorSocket;
    QObject::connect(simulatorSocket, &QWebSocket::connected, &simulator,
                     [&simulator]() -> void { simulator.setActiveConnections(1); });
    QObject::connect(simulatorSocket, &QWebSocket::disconnected, &simulator,
                     [&simulator]() -> void { simulator.setActiveConnections(0); });
    interface->setMessageTypeBlacklist({ GreenHouse::EventInvoked, GreenHouse::MethodInvoked });
    interface->installPayloadHook([&](const QJsonObject &data) -> void {
        if (simulator.processMessagePayload(data))
            return;

        auto objIt = data.constFind(GreenHouse::THEMES_RESPONSE_TAG);
        if (objIt != data.constEnd()) {
            const QJsonArray array = objIt.value().toArray();
            QStringList themes;
            for (const auto &value : array)
                themes.append(value.toString());
            simulator.setAvailableThemes(themes);
        }

        objIt = data.constFind(GreenHouse::OBJECT_ID_TAG);
        if (objIt != data.constEnd()) {
            auto objectWrapper = simulator.object(objIt.value().toInt());
            if (!objectWrapper)
                return;

            objIt = data.constFind(GreenHouse::MSG_TYPE_TAG);
            if (objIt == data.constEnd())
                return;

            GreenHouse::MessageType messageType =
                    GreenHouse::MessageType(objIt.value().toInt(GreenHouse::InvalidOperation));
            objIt = data.constFind(GreenHouse::MSG_DATA_TAG);
            if (objIt == data.constEnd())
                return;
            const QJsonObject payloadData = objIt.value().toObject();
            switch (messageType) {
            case GreenHouse::MethodInvoked: {
                auto method = objectWrapper->method(payloadData.value(GreenHouse::NAME_TAG).toString());
                if (method)
                    method->call(payloadData.value(GreenHouse::ARGS_TAG).toObject().toVariantMap());
            } break;
            case GreenHouse::EventInvoked: {
                auto event = objectWrapper->event(payloadData.value(GreenHouse::NAME_TAG).toString());
                if (event)
                    event->call(payloadData.value(GreenHouse::ARGS_TAG).toObject().toVariantMap());
            } break;
            default:
                break;
            }
        }
    });

    return app.exec();
}
