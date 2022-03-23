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
find_package(QT NAMES Qt6 Qt5)

add_subdirectory(lib/GreenHouse/)
add_subdirectory(lib/AppCore/)
add_subdirectory(src/AppPlugins/)
add_subdirectory(src/App/)
add_subdirectory(src/Gui/)
add_subdirectory(src/Simulator/)
add_subdirectory(tests/)
file(COPY translations/ DESTINATION ${CMAKE_BINARY_DIR}/translations)
file(COPY scripts/run.sh DESTINATION ${CMAKE_BINARY_DIR}/scripts
    FILE_PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
