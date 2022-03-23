cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_AUTOMOC ON)

set(GOOGLETEST_DIR $ENV{GOOGLETEST_DIR})

# Disables warnings from -Wundef
include_directories(SYSTEM
    ${GOOGLETEST_DIR}/googletest
    ${GOOGLETEST_DIR}/googletest/include
    ${GOOGLETEST_DIR}/googlemock
    ${GOOGLETEST_DIR}/googlemock/include
    )

set(googletest_src
    ${GOOGLETEST_DIR}/googletest/src/gtest-all.cc
    ${GOOGLETEST_DIR}/googlemock/src/gmock-all.cc
)

enable_testing()
