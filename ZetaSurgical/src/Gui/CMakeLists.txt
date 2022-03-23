set(gui_h
integration.h
)

set(gui_cpp
main.cpp
integration.cpp
)

include(../ZetaSurgical/ZetaSurgical.Gui.cmake)

if(QT_VERSION_MAJOR EQUAL 6)
    find_package(Qt6 COMPONENTS Quick Core Network WebSockets REQUIRED)
else()
    find_package(Qt5 COMPONENTS Quick Core Network WebSockets REQUIRED)
endif()
set(gui_qrc qml.qrc )
if(BUILD_SIMULATOR)
    add_definitions( -DGREENHOUSE_SIMULATION )
endif()
add_definitions( -DGREENHOUSE_GUI )

if (WIN32)
    add_executable(gui WIN32 ${gui_h} ${gui_cpp} ${gui_qrc} ${layouts_qrc})
else()
    add_executable(gui ${gui_h} ${gui_cpp} ${gui_qrc} ${layouts_qrc})
endif()

target_include_directories(gui PUBLIC ../../lib/GreenHouse)
target_include_directories(gui PUBLIC ../../lib/AppCore)
if(QT_VERSION_MAJOR EQUAL 6)
    target_link_libraries(gui appcore gh Qt6::Quick Qt6::Core Qt6::Network Qt6::WebSockets)
else()
    target_link_libraries(gui appcore gh Qt5::Quick Qt5::Core Qt5::Network Qt5::WebSockets)
endif()

target_compile_definitions(gui PUBLIC QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII QT_NO_URL_CAST_FROM_STRING)
