set(wxWidgets_USE_DEBUG OFF)
set(wxWidgets_USE_UNICODE ON)
set(wxWidgets_USE_UNIVERSAL OFF)
set(wxWidgets_USE_STATIC ON)
find_package(wxWidgets COMPONENTS richtext xml html xrc adv aui core base gl)

include(${wxWidgets_USE_FILE})

message(STATUS "wxWidgets_DEFINITIONS: ${wxWidgets_DEFINITIONS}")
message(STATUS "wxWidgets_INCLUDE_DIRS: ${wxWidgets_INCLUDE_DIRS}")
message(STATUS "wxWidgets_LIBRARIES: ${wxWidgets_LIBRARIES}")

add_subdirectory(LMS8001)
include_directories(LMS8001)

set(LimeRFE_8001PAPI_SOURCES
    LimeRFE_8001P_cmd.cpp
    LimeRFE_8001P_api.cpp
    LimeRFE_8001P_Device.cpp
#milans 221128	
	LMS8001/API/lms8_device.cpp
	LMS8001/lms8001/connectionManager/ConnectionManager.cpp
	LMS8001/lms8001/connectionManager/ConnectionCOM.cpp
	LMS8001/lms8001/LMS8001.cpp
	LMS8001/lms8001/lmsComms.cpp
	LMS8001/lms8001/LMS8001_RegistersMap.cpp
	LMS8001/lms8001/LMS8001_parameters.cpp
    LMS8001/ADF4002/ADF4002.cpp    
)

SET(LimeRFE_8001PAPI_INCLUDES
    external/cpp-feather-ini-parser
#    LMS8001
#milans 221128
	LMS8001/ADF4002
	LMS8001/API
	LMS8001/lms8001
)

#if(MSVC)
#    list(APPEND LimeRFE_8001PAPI_SOURCES external/termiWin/termiWin.c)
#    list(APPEND LimeRFE_8001PAPI_INCLUDES external/termiWin)    
#endif()

add_library(LimeRFE_8001PAPI SHARED ${LimeRFE_8001PAPI_SOURCES})
target_include_directories(LimeRFE_8001PAPI PUBLIC ${LimeRFE_8001PAPI_INCLUDES})

set(LimeRFE_8001P_SOURCES
    LimeRFE_8001P_wxgui.cpp
    LimeRFE_8001P_gui.cpp
    LimeRFE_8001P_app.cpp
    LimeRFE_8001P_cmd.cpp    
#    LMS8001/lms8suiteApp.cpp
)

add_executable(LimeRFE_8001P ${LimeRFE_8001P_SOURCES} resources/resource.rc)

set(BINARY_OUTPUT_DIR "${CMAKE_BINARY_DIR}/bin")

set_target_properties(LimeRFE_8001P PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${BINARY_OUTPUT_DIR})

# LINK_DIRECTORIES(/usr/local/lib)

target_link_libraries(
    LimeRFE_8001PAPI
    LMS8001
    lms8suite     
)
## insert LimeSuite when SPI is used

target_link_libraries(
    LimeRFE_8001P 
    LimeRFE_8001PAPI
    LMS8001
    lms8suite    
    ${wxWidgets_LIBRARIES}    
)
## insert LimeSuite when SPI is used


if (MSVC)
    target_compile_definitions(LimeRFE_8001P PRIVATE WIN32_LEAN_AND_MEAN)
    set_property(TARGET LimeRFE_8001P APPEND PROPERTY LINK_FLAGS /SUBSYSTEM:WINDOWS)
endif(MSVC)

set_target_properties(LimeRFE_8001PAPI PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

add_subdirectory(examples)

install(TARGETS LimeRFE_8001PAPI
    LIBRARY DESTINATION lib${LIB_SUFFIX} # .so file
    ARCHIVE DESTINATION lib${LIB_SUFFIX} # .lib file
    RUNTIME DESTINATION bin              # .dll file
)

