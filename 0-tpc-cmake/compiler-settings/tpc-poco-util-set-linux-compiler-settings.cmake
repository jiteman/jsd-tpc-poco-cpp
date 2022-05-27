JSD_CMAKE_CURRENT_FILE_IN( "${JSD_SSC_FULL_NAME}-linux-compiler-settings.cmake" )

if ( UNIX )
	# C++ common
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	## list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-W" ) #
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-unused-parameter" ) # unused parameter ''
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-shadow" ) # declaration of '' shadows a previous local/parameter
	#list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-conversion" ) # conversion from '' to '' may change value
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-sign-compare" ) # comparison of integer expressions of different signedness: '' and '' {aka ''}
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-float-conversion" ) # conversion from '' to '' changes value from '' to ''
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-float-equal" ) # comparing floating point with == or != is unsafe
	#list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-inline" ) # inlining failed in call to '' call is unlikely and code size would grow

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) #

	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )

	# C++ release
	set( ${PROJECT_NAME}_CXX_FLAGS_RELEASE ${CMAKE_CXX_FLAGS_RELEASE} )

	## list( APPEND ${PROJECT_NAME}_CXX_FLAGS_RELEASE "-Wno-" ) #
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS_RELEASE "-finline-limit=700" ) # # default ( 600 )
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS_RELEASE "--param inline-unit-growth=125" ) # default ( 50 )
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS_RELEASE "-Wno-inline" ) # inlining failed in call to '' call is unlikely and code size would grow

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_RELEASE_STR "${${PROJECT_NAME}_CXX_FLAGS_RELEASE}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_CXX_FLAGS_RELEASE_STR "${${PROJECT_NAME}_CXX_FLAGS_RELEASE_STR}" ) #

	set( CMAKE_CXX_FLAGS_RELEASE ${${PROJECT_NAME}_CXX_FLAGS_RELEASE_STR} )

else()
	message( SEND_ERROR "[JSD] ${JSD_SSC_FULL_NAME} COMPILER SETTINGS: ${JSD_SSC_FULL_NAME}-linux-compiler-settings.cmake is included while not on linux" )

endif()

JSD_CMAKE_CURRENT_FILE_OUT( "${JSD_SSC_FULL_NAME}-linux-compiler-settings.cmake" )
