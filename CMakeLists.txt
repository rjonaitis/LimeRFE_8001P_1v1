set (CMAKE_CXX_STANDARD 11)
cmake_minimum_required(VERSION 3.1.3)

# Select the release build type by default to get optimization flags.
# This has to come before project() which otherwise initializes it.
# Build type can still be overridden by setting -DCMAKE_BUILD_TYPE=
set(CMAKE_BUILD_TYPE
    "Release"
    CACHE STRING "")

project (LimeRFE_8001P)
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")

#include modules for finding CyAPI
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

add_subdirectory(LimeRFE_8001P)
# option(BUILD_SHARED_LIBS "Build the shared library" ON)

add_subdirectory(cli)
