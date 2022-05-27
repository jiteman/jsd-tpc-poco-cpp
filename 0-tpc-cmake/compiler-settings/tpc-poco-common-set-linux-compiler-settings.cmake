JSD_CMAKE_CURRENT_FILE_IN( "${JSD_SSC_BASE_NAME}-common-set-linux-compiler-settings.cmake" )

if ( UNIX )
	## set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	## list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-" ) #

	##string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) #

	## set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )

	## set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-format" )
else()
	message( SEND_ERROR "[JSD] ${JSD_SSC_BASE_NAME}-common COMPILER SETTINGS: ${JSD_SSC_BASE_NAME}-common-set-linux-compiler-settings.cmake is included while not on linux" )

endif()

JSD_CMAKE_CURRENT_FILE_OUT( "${JSD_SSC_BASE_NAME}-common-set-linux-compiler-settings.cmake" )
