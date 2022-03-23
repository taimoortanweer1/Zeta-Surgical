set(app_h
integration.h
)

set(app_cpp
main.cpp
integration.cpp
)

set(other_files
plugins/config.json
)
add_custom_target(other-files SOURCES ${other_files})

if (HEADLESS_BUILD)
    if(QT_VERSION_MAJOR EQUAL 6)
        find_package(Qt6 COMPONENTS Core WebSockets REQUIRED)
    else()
        find_package(Qt5 COMPONENTS Core WebSockets REQUIRED)
    endif()
    add_executable(app ${app_h} ${app_cpp})

    target_include_directories(app PUBLIC ../../lib/GreenHouse)
    target_include_directories(app PUBLIC ../../lib/AppCore)
    if(QT_VERSION_MAJOR EQUAL 6)
        target_link_libraries(app appcore gh Qt6::Core Qt6::WebSockets)
    else()
        target_link_libraries(app appcore gh Qt5::Core Qt5::WebSockets)
    endif()
else()
    if(QT_VERSION_MAJOR EQUAL 6)
        find_package(Qt6 COMPONENTS Quick Core Network WebSockets REQUIRED)
    else()
        find_package(Qt5 COMPONENTS Quick Core Network WebSockets REQUIRED)
    endif()
    set(app_qrc qml.qrc )
    if(BUILD_SIMULATOR)
        add_definitions( -DGREENHOUSE_SIMULATION )
    endif()
    add_definitions( -DGREENHOUSE_GUI )
    include(../ZetaSurgical/ZetaSurgical.Gui.cmake)

    if (WIN32)
        add_executable(app WIN32 ${app_h} ${app_cpp} ${app_qrc} ${layouts_qrc})
    else()
        add_executable(app ${app_h} ${app_cpp} ${app_qrc} ${layouts_qrc})
    endif()

    target_include_directories(app PUBLIC ../../lib/GreenHouse)
    target_include_directories(app PUBLIC ../../lib/AppCore)
    if(QT_VERSION_MAJOR EQUAL 6)
        target_link_libraries(app appcore gh Qt6::Quick Qt6::Core Qt6::Network Qt6::WebSockets)
    else()
        target_link_libraries(app appcore gh Qt5::Quick Qt5::Core Qt5::Network Qt5::WebSockets)
    endif()
endif()

target_compile_definitions(app PUBLIC QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII QT_NO_URL_CAST_FROM_STRING)

file(COPY plugins/ DESTINATION ${CMAKE_BINARY_DIR}/plugins)
