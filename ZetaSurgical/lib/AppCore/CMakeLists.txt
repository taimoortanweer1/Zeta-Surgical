set(appcore_h
appcore_global.h
appcore_log.h
interfaceid.h
applicationpluginmanager.h
applicationplugininterface.h
appcommandlineparser.h)

set(appcore_cpp
appcore_log.cpp
applicationpluginmanager.cpp
applicationplugininterface.cpp
appcommandlineparser.cpp)

set(core_runtime_packages )
set(core_runtime_libs )
set(core_qrc )
include(ZetaSurgical/ZetaSurgical.Core.cmake)

set(core_custom_h )
set(core_custom_cpp )
set(core_custom_qrc )
if(EXISTS "ZetaSurgical.Core.Custom.cmake")
    include(ZetaSurgical.Custom.cmake)
endif()

if (HEADLESS_BUILD)
    if(QT_VERSION_MAJOR EQUAL 6)
        find_package(Qt6 COMPONENTS Core WebSockets)
    else()
        find_package(Qt5 COMPONENTS Core WebSockets)
    endif()
    set(imports_qrc )
else()
    if(QT_VERSION_MAJOR EQUAL 6)
        find_package(Qt6 COMPONENTS Quick Core Network WebSockets ${core_runtime_packages})
        qt6_add_resources(imports_qrc imports.qrc)
    else()
        find_package(Qt5 COMPONENTS Quick Core Network WebSockets ${core_runtime_packages})

        if (CMAKE_BUILD_TYPE STREQUAL "Debug")
            set(imports_qrc imports.qrc)
        else()
            find_package(Qt5QuickCompiler)
            qtquick_compiler_add_resources(imports_qrc imports.qrc)
        endif()
    endif()
    add_definitions( -DGREENHOUSE_GUI )
endif()

add_definitions( -DAPPCORE_LIBRARY )

add_library(appcore SHARED ${appcore_h} ${appcore_cpp} ${core_h} ${core_cpp} ${core_qrc} ${imports_qrc}
            ${core_custom_h} ${core_custom_cpp} ${core_custom_qrc})

target_include_directories(appcore PUBLIC ../GreenHouse)
target_link_libraries(appcore gh)
target_compile_definitions(appcore PUBLIC QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII QT_NO_URL_CAST_FROM_STRING)

if (HEADLESS_BUILD)
    if(QT_VERSION_MAJOR EQUAL 6)
        target_link_libraries(appcore Qt6::Core Qt6::WebSockets)
    else()
        target_link_libraries(appcore Qt5::Core Qt5::WebSockets)
    endif()
else()
    if(QT_VERSION_MAJOR EQUAL 6)
        target_link_libraries(appcore Qt6::Quick Qt6::Core Qt6::Network Qt6::WebSockets ${core_runtime_libs})
    else()
        target_link_libraries(appcore Qt5::Quick Qt5::Core Qt5::Network Qt5::WebSockets ${core_runtime_libs})
    endif()
endif()
