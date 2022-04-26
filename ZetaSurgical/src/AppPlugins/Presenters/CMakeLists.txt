cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(presenters_h
presenters.h
Keyboard/keyboardpresenterimpl.h
Keyboard/keyboardconstants.h
Keyboard/keyboard_log.h
)

set(presenters_cpp
Keyboard/keyboardpresenterimpl.cpp
presenters.cpp
)

set(resources Keyboard/resources.qrc)

add_definitions( -DGREENHOUSE_GUI )

include(Implementations.cmake)

set(CMAKE_AUTOMOC ON)

find_package(Qt5 REQUIRED COMPONENTS Core Quick Qml QuickControls2 Websockets REQUIRED)

add_library(presenters SHARED ${presenters_h} ${presenters_cpp} ${impl_h} ${impl_cpp} ${resources})

target_include_directories(presenters PUBLIC ../../../lib/GreenHouse)
target_include_directories(presenters PUBLIC ../../../lib/AppCore)

target_link_libraries(presenters
        gh
        appcore
        Qt5::Core
        ${VTK_LIBRARIES}
        Qt5::Quick Qt5::Network Qt5::WebSockets
        Qt5::QuickControls2
)

target_compile_definitions(presenters PUBLIC QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII QT_NO_URL_CAST_FROM_STRING)

set_target_properties(presenters PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/plugins"
        LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/plugins"
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/plugins"

        ARCHIVE_OUTPUT_DIRECTORY_DEBUG "${CMAKE_BINARY_DIR}/plugins"
        LIBRARY_OUTPUT_DIRECTORY_DEBUG "${CMAKE_BINARY_DIR}/plugins"
        RUNTIME_OUTPUT_DIRECTORY_DEBUG "${CMAKE_BINARY_DIR}/plugins"

        ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_BINARY_DIR}/plugins"
        LIBRARY_OUTPUT_DIRECTORY_RELEASE "${CMAKE_BINARY_DIR}/plugins"
        RUNTIME_OUTPUT_DIRECTORY_RELEASE "${CMAKE_BINARY_DIR}/plugins"

        ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO "${CMAKE_BINARY_DIR}/plugins"
        LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO "${CMAKE_BINARY_DIR}/plugins"
        RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO "${CMAKE_BINARY_DIR}/plugins"

        ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL "${CMAKE_BINARY_DIR}/plugins"
        LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL "${CMAKE_BINARY_DIR}/plugins"
        RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL "${CMAKE_BINARY_DIR}/plugins"
)
