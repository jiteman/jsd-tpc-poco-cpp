JSD_CMAKE_CURRENT_FILE_IN( "${JSD_SSC_FULL_NAME}-linux-compiler-settings.cmake" )

if ( UNIX )
	# C
	set( ${PROJECT_NAME}_C_FLAGS ${CMAKE_C_FLAGS} )

	## list( APPEND ${PROJECT_NAME}_C_FLAGS "-W" ) #
	list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-sign-conversion" ) # conversion to '' from '' may change the sign of the result
	list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-conversion" ) # conversion from '' to '' may change value
	#list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-cast-qual" ) # cast from type '' to type '' casts away qualifiers
	#list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-implicit-fallthrough" ) # this statement may fall through
	#list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-format-truncation" ) # '' directive output may be truncated writing up to A bytes into a region of size between B and C

	string( REPLACE ";" " " ${PROJECT_NAME}_C_FLAGS_STR "${${PROJECT_NAME}_C_FLAGS}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_C_FLAGS_STR "${${PROJECT_NAME}_C_FLAGS_STR}" ) #

	set( CMAKE_C_FLAGS ${${PROJECT_NAME}_C_FLAGS_STR} )

	# C++ common
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	## list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-W" ) #
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-conversion" ) # conversion from '' to '' may change value
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-float-equal" ) # comparing floating point with == or != is unsafe
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-sign-compare" ) # comparison of integer expressions of different signedness: '' and '' {aka ''}
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-unused-parameter" ) # unused parameter ''
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-shadow" ) # declaration of '' shadows a previous local
	#list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-inline" ) # inlining failed in call to '' call is unlikely and code size would grow
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-float-conversion" ) # conversion from '' to '' changes value from '' to ''

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
