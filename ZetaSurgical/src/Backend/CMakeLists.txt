set(backend_h
)

set(backend_cpp
main.cpp
)

if(QT_VERSION_MAJOR EQUAL 6)
    find_package(Qt6 COMPONENTS Core Network WebSockets REQUIRED)
else()
    find_package(Qt5 COMPONENTS Core Network WebSockets REQUIRED)
endif()

if(BUILD_SIMULATOR)
    add_definitions( -DGREENHOUSE_SIMULATION )
endif()
add_definitions( -DGREENHOUSE_GUI )

if (WIN32)
    add_executable(backend WIN32 ${backend_h} ${backend_cpp})
else()
    add_executable(backend ${backend_h} ${backend_cpp})
endif()

target_include_directories(backend PUBLIC ../../lib/GreenHouse)
target_include_directories(backend PUBLIC ../../lib/AppCore)
if(QT_VERSION_MAJOR EQUAL 6)
    target_link_libraries(backend appcore gh Qt6::Core Qt6::Network Qt6::WebSockets)
else()
    target_link_libraries(backend appcore gh Qt5::Core Qt5::Network Qt5::WebSockets)
endif()

target_compile_definitions(backend PUBLIC QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII QT_NO_URL_CAST_FROM_STRING)
