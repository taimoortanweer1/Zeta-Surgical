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

set(app_custom_h )
set(app_custom_cpp )
set(app_custom_qrc )
if(EXISTS "App.Custom.cmake")
    include(App.Custom.cmake)
endif()

if (HEADLESS_BUILD)
    if(QT_VERSION_MAJOR EQUAL 6)
        find_package(Qt6 COMPONENTS Core WebSockets Quick Qml REQUIRED)
    else()
        find_package(Qt5 COMPONENTS Core WebSockets Quick Qml REQUIRED)
    endif()
    add_executable(app ${app_h} ${app_cpp}
                   ${app_custom_h} ${app_custom_cpp} ${app_custom_qrc})

    target_include_directories(app PUBLIC ../../lib/GreenHouse)
    target_include_directories(app PUBLIC ../../lib/AppCore)

    if(QT_VERSION_MAJOR EQUAL 6)
        target_link_libraries(app appcore gh Qt6::Core Qt6::WebSockets)
    else()
        target_link_libraries(app appcore gh Qt5::Core Qt5::WebSockets)
    endif()
else()

    include(../ZetaSurgical/ZetaSurgical.Gui.cmake)
    if(QT_VERSION_MAJOR EQUAL 6)
        find_package(Qt6 COMPONENTS Quick Core Network WebSockets Qml REQUIRED)
        qt6_add_resources(app_qrc qml.qrc ${layouts_qrc})
    else()
        find_package(Qt5 COMPONENTS Quick Core Network WebSockets Qml QuickControls2 REQUIRED)

        if (CMAKE_BUILD_TYPE STREQUAL "Debug")
            set(app_qrc qml.qrc ${layouts_qrc})
        else()
            find_package(Qt5QuickCompiler)
            qtquick_compiler_add_resources(app_qrc qml.qrc ${layouts_qrc})
        endif()
    endif()

    if(BUILD_SIMULATOR)
        add_definitions( -DGREENHOUSE_SIMULATION )
    endif()

    add_definitions( -DGREENHOUSE_GUI )

    if (WIN32)
        add_executable(app ${app_h} ${app_cpp} ${app_qrc}
                       ${app_custom_h} ${app_custom_cpp} ${app_custom_qrc})
    else()
        add_executable(app ${app_h} ${app_cpp} ${app_qrc}
                       ${app_custom_h} ${app_custom_cpp} ${app_custom_qrc})
    endif()

    target_include_directories(app PUBLIC ../../lib/GreenHouse)
    target_include_directories(app PUBLIC ../../lib/AppCore)
    if(QT_VERSION_MAJOR EQUAL 6)
        target_link_libraries(app appcore gh Qt6::Quick Qt6::Core Qt6::Network Qt6::WebSockets)
    else()
        target_link_libraries(app appcore gh Qt5::Quick Qt5::Core Qt5::Network Qt5::WebSockets ${VTK_LIBRARIES} 
        Qt5::QuickControls2)
    endif()
endif()

target_compile_definitions(app PUBLIC QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII QT_NO_URL_CAST_FROM_STRING)

file(COPY plugins/ DESTINATION ${CMAKE_BINARY_DIR}/plugins)
