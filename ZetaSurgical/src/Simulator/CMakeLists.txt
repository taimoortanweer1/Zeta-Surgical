set(simulator_hpp
datasampler.hpp
init.hpp
scriptsyntaxhighlighter.hpp
simulator.hpp
simulator_version.h
)

set(simulator_cpp
datasampler.cpp
init.cpp
main.cpp
scriptsyntaxhighlighter.cpp
simulator.cpp
)

set(simulator_qrc
imports.qrc
assets.qrc
qml.qrc
resources.qrc
)

set(QML_IMPORT_PATH ${CMAKE_SOURCE_DIR}/imports CACHE STRING "" FORCE)

if(QT_VERSION_MAJOR EQUAL 6)
    find_package(Qt6 COMPONENTS Quick Core Network WebSockets Widgets REQUIRED)
else()
    find_package(Qt5 COMPONENTS Quick Core Network WebSockets Widgets REQUIRED)
endif()
add_definitions( -DGREENHOUSE_GUI )

if (WIN32)
    add_executable(simulator WIN32 ${simulator_hpp} ${simulator_cpp} ${simulator_qrc})
else()
    add_executable(simulator ${simulator_hpp} ${simulator_cpp} ${simulator_qrc})
endif()

target_include_directories(simulator PUBLIC ../../lib/GreenHouse)
target_include_directories(simulator PUBLIC ../../lib/AppCore)
if(QT_VERSION_MAJOR EQUAL 6)
    target_link_libraries(simulator appcore gh Qt6::Quick Qt6::Core Qt6::Network Qt6::WebSockets Qt6::Widgets)
else()
    target_link_libraries(simulator appcore gh Qt5::Quick Qt5::Core Qt5::Network Qt5::WebSockets Qt5::Widgets)
endif()

target_compile_definitions(simulator PUBLIC QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII QT_NO_URL_CAST_FROM_STRING)

if(APPLE)
    set(APPICON ${CMAKE_CURRENT_SOURCE_DIR}/icons/Simulator.icns)
endif()

if(WIN32)
    set(RC_ICONS ${CMAKE_CURRENT_SOURCE_DIR}/icons/Simulator.ico)
endif()

if(EXISTS "${CMAKE_SOURCE_DIR}/simScripts")
    file(COPY ${CMAKE_SOURCE_DIR}/simScripts/ DESTINATION ${CMAKE_BINARY_DIR}/simScripts)
endif()
