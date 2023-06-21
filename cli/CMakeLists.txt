add_executable(LimeRFE_8001P_start LimeRFE_8001P_start.cpp)
set_target_properties(LimeRFE_8001P_start PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
target_include_directories(LimeRFE_8001P_start PUBLIC
	${PROJECT_SOURCE_DIR}/LimeRFE_8001P
)

target_link_libraries(LimeRFE_8001P_start PUBLIC 
	LimeRFE_8001PAPI
    LMS8001
    lms8suite
)

add_executable(LimeRFE_8001P_stop LimeRFE_8001P_stop.cpp)
set_target_properties(LimeRFE_8001P_stop PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
target_include_directories(LimeRFE_8001P_stop PUBLIC
	${PROJECT_SOURCE_DIR}/LimeRFE_8001P
)

target_link_libraries(LimeRFE_8001P_stop PUBLIC
	LimeRFE_8001PAPI
    LMS8001
    lms8suite
)