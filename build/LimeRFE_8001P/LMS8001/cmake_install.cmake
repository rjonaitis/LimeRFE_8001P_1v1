# Install script for directory: /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/LimeRFE_8001P/LMS8001

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/LMS8001/lms8001_wxgui/cmake_install.cmake")
  include("/home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/LMS8001/lms8001/cmake_install.cmake")
  include("/home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/LMS8001/lms8suiteEvents/cmake_install.cmake")
  include("/home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/LMS8001/utilities_gui/cmake_install.cmake")
  include("/home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/LMS8001/ADF4002/cmake_install.cmake")
  include("/home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/LMS8001/Si5351C/cmake_install.cmake")
  include("/home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/LMS8001/examples/cmake_install.cmake")

endif()
