cmake_minimum_required(VERSION 3.1)
project(ZetaSurgical)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  # using Clang
  SET(GCC_COVERAGE_COMPILE_FLAGS
   "-Wnon-virtual-dtor -Wundef -Wcast-align \
    -Wchar-subscripts -Wpointer-arith \
    -Wwrite-strings -Wpacked -Wformat-security \
    -Wmissing-format-attribute -Woverloaded-virtual -Werror=reorder \
    -Werror=return-type -Werror=missing-include-dirs -Werror=conversion-null \
    -Werror=enum-compare \
    -Warray-bounds-pointer-arithmetic \
    -Wassign-enum \
    -Wbad-function-cast \
    -Wbool-conversions \
    -Wall -Wextra -pedantic")
  SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GCC_COVERAGE_COMPILE_FLAGS}")
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    SET(GCC_COVERAGE_COMPILE_FLAGS
   "-Wnon-virtual-dtor -Wundef -Wcast-align \
    -Wchar-subscripts -Wpointer-arith \
    -Wwrite-strings -Wpacked -Wformat-security \
    -Wmissing-format-attribute -Woverloaded-virtual -Werror=reorder \
    -Werror=return-type -Werror=missing-include-dirs -Werror=conversion-null \
    -Werror=enum-compare \
    -Wall -Wextra -pedantic")
  SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GCC_COVERAGE_COMPILE_FLAGS}")
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  # using Visual Studio C++
endif()

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)
# Instruct CMake to run rcc automatically when needed.
set(CMAKE_AUTORCC ON)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Define Qt version
option(UseQt6 "UseQt6" OFF)
if (UseQt6)
    find_package(QT NAMES Qt6)
    set(qt_major Qt6)
else()
    find_package(QT NAMES Qt5)
    set(qt_major Qt5)
endif()

add_subdirectory(lib/GreenHouse/)
add_subdirectory(lib/AppCore/)
add_subdirectory(src/AppPlugins/)
add_subdirectory(src/App/)
add_subdirectory(src/Backend/)

if (HEADLESS_BUILD)
    # Simulator and Gui projects can not be built in headless mode
else()
    add_subdirectory(src/Gui/)
    if(QT_VERSION_MAJOR EQUAL 6 OR (QT_VERSION_MAJOR EQUAL 5 AND QT_VERSION_MINOR GREATER_EQUAL 14))
        add_subdirectory(src/Simulator/)
    endif()
endif()

add_subdirectory(tests/)
file(COPY translations/ DESTINATION ${CMAKE_BINARY_DIR}/translations)
file(COPY scripts/run.sh DESTINATION ${CMAKE_BINARY_DIR}/scripts
    FILE_PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
