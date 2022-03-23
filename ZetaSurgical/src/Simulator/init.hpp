/**********************************************************************************************************************
 * (C) Copyright 2021 Integrated Computer Solutions, Inc. - All rights reserved.
 **********************************************************************************************************************/

#ifndef INIT_HPP
#define INIT_HPP

#include <greenhousecontext.h>

namespace GreenHouseRuntimeTools {
class Simulator;
}

#define OBJECT_WRAPPER(IFACE)                                                                                          \
    if (!ctx->get<IFACE>())                                                                                            \
        ctx->store(new IFACE);                                                                                         \
    ctx->get<IFACE>()->disableDisplayFormatting();                                                                     \
    GreenHouseRuntimeTools::ContextObjectWrapper *objWarpper = new GreenHouseRuntimeTools::ContextObjectWrapper(       \
            QStringLiteral(#IFACE), ctx, [](GreenHouse::Context *ctx) -> QObject * { return ctx->get<IFACE>(); },      \
            simulator);                                                                                                \
    simulator->registerObject(objWarpper, IFACE::storeId());

#define PROPERTY_WRAPPER(IFACE, PROPERTY_NAME, NOTIFY_SIGNAL, SETTER, TYPE, TO_TYPE)                                   \
    {                                                                                                                  \
        GreenHouseRuntimeTools::ContextObjectPropertyWrapper *propWrapper;                                             \
        propWrapper = new GreenHouseRuntimeTools::ContextObjectPropertyWrapper(                                        \
                QStringLiteral(#PROPERTY_NAME), TYPE, ctx,                                                             \
                [](GreenHouse::Context *context) -> QVariant {                                                         \
                    CONTEXT_OBJECT_R(IFACE, co, QVariant()) return co->PROPERTY_NAME();                                \
                },                                                                                                     \
                [](GreenHouse::Context *context, const QVariant &val) -> void {                                        \
                    CONTEXT_OBJECT(IFACE, co) co->SETTER(TO_TYPE);                                                     \
                },                                                                                                     \
                objWarpper);                                                                                           \
        QObject::connect(ctx->get<IFACE>(), NOTIFY_SIGNAL, propWrapper,                                                \
                         &GreenHouseRuntimeTools::ContextObjectPropertyWrapper::valueChanged);                         \
        objWarpper->registerProperty(propWrapper);                                                                     \
    }

#define PROTECTED_PROPERTY_WRAPPER(IFACE, PROPERTY_NAME, NOTIFY_SIGNAL, TYPE, TO_TYPE)                                 \
    {                                                                                                                  \
        GreenHouseRuntimeTools::ContextObjectPropertyWrapper *propWrapper;                                             \
        propWrapper = new GreenHouseRuntimeTools::ContextObjectPropertyWrapper(                                        \
                QStringLiteral(#PROPERTY_NAME), TYPE, ctx,                                                             \
                [](GreenHouse::Context *context) -> QVariant {                                                         \
                    CONTEXT_OBJECT_R(IFACE, co, QVariant()) return co->PROPERTY_NAME();                                \
                },                                                                                                     \
                nullptr, objWarpper);                                                                                  \
        QObject::connect(ctx->get<IFACE>(), NOTIFY_SIGNAL, propWrapper,                                                \
                         &GreenHouseRuntimeTools::ContextObjectPropertyWrapper::valueChanged);                         \
        objWarpper->registerProperty(propWrapper);                                                                     \
    }

#define MODEL_PROPERTY_WRAPPER(IFACE, PROPERTY_NAME, TYPE)                                                             \
    {                                                                                                                  \
        GreenHouseRuntimeTools::ContextObjectPropertyWrapper *propWrapper;                                             \
        propWrapper = new GreenHouseRuntimeTools::ContextObjectPropertyWrapper(                                        \
                QStringLiteral(#PROPERTY_NAME), TYPE, ctx,                                                             \
                [](GreenHouse::Context *context) -> QVariant {                                                         \
                    CONTEXT_OBJECT_R(IFACE, co, QVariant()) return QVariant::fromValue(co->PROPERTY_NAME());           \
                },                                                                                                     \
                [](GreenHouse::Context *context, const QVariant &val) -> void {                                        \
                    Q_UNUSED(context)                                                                                  \
                    Q_UNUSED(val)                                                                                      \
                },                                                                                                     \
                objWarpper);                                                                                           \
        objWarpper->registerProperty(propWrapper);                                                                     \
    }

#define METHOD_WRAPPER(IFACE, METHOD_NAME, ...)                                                                        \
    GreenHouseRuntimeTools::ContextObjectEndpointWrapper *wrapper;                                                     \
    wrapper = new GreenHouseRuntimeTools::ContextObjectEndpointWrapper(                                                \
            QStringLiteral(#METHOD_NAME), ctx,                                                                         \
            [](GreenHouse::Context *context, const QVariantList &args) -> void {                                       \
                CONTEXT_OBJECT(IFACE, co) co->METHOD_NAME(__VA_ARGS__);                                                \
            },                                                                                                         \
            objWarpper);                                                                                               \
    objWarpper->registerMethod(wrapper);

#define METHOD_NO_ARGS_WRAPPER(IFACE, METHOD_NAME)                                                                     \
    GreenHouseRuntimeTools::ContextObjectEndpointWrapper *wrapper;                                                     \
    wrapper = new GreenHouseRuntimeTools::ContextObjectEndpointWrapper(                                                \
            QStringLiteral(#METHOD_NAME), ctx,                                                                         \
            [](GreenHouse::Context *context, const QVariantList &) -> void {                                           \
                CONTEXT_OBJECT(IFACE, co) co->METHOD_NAME();                                                           \
            },                                                                                                         \
            objWarpper);                                                                                               \
    objWarpper->registerMethod(wrapper);

#define SIGNAL_WRAPPER(IFACE, SIGNAL_NAME, ...)                                                                        \
    GreenHouseRuntimeTools::ContextObjectEndpointWrapper *wrapper;                                                     \
    wrapper = new GreenHouseRuntimeTools::ContextObjectEndpointWrapper(                                                \
            QStringLiteral(#SIGNAL_NAME), ctx,                                                                         \
            [](GreenHouse::Context *context, const QVariantList &args) -> void {                                       \
                CONTEXT_OBJECT(IFACE, co) co->SIGNAL_NAME(__VA_ARGS__);                                                \
            },                                                                                                         \
            objWarpper);                                                                                               \
    objWarpper->registerEvent(wrapper);

#define SIGNAL_NO_ARGS_WRAPPER(IFACE, SIGNAL_NAME)                                                                     \
    GreenHouseRuntimeTools::ContextObjectEndpointWrapper *wrapper;                                                     \
    wrapper = new GreenHouseRuntimeTools::ContextObjectEndpointWrapper(                                                \
            QStringLiteral(#SIGNAL_NAME), ctx,                                                                         \
            [](GreenHouse::Context *context, const QVariantList &) -> void {                                           \
                CONTEXT_OBJECT(IFACE, co) co->SIGNAL_NAME();                                                           \
            },                                                                                                         \
            objWarpper);                                                                                               \
    objWarpper->registerEvent(wrapper);

#define ARGUMENT_WRAPPER(NAME, TYPE)                                                                                   \
    {                                                                                                                  \
        GreenHouseRuntimeTools::ArgumentWrapper *argument;                                                             \
        argument = new GreenHouseRuntimeTools::ArgumentWrapper(QStringLiteral(#NAME), TYPE, wrapper);                  \
        wrapper->addArgument(argument);                                                                                \
    }

void initialize(GreenHouseRuntimeTools::Simulator *simulator, GreenHouse::Context *ctx,
                const QString &projectFilePath = QString());

#endif // INIT_HPP
