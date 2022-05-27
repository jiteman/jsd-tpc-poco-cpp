JSD_CMAKE_CURRENT_FILE_IN( "${JSD_SSC_FULL_NAME}-linux-compiler-settings.cmake" )

if ( UNIX )
	# C common
	set( ${PROJECT_NAME}_C_FLAGS ${CMAKE_C_FLAGS} )

	## list( APPEND ${PROJECT_NAME}_C_FLAGS "-W" ) #
	list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-sign-conversion" ) # conversion to '' from '' may change the sign of the result
	list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-conversion" ) # conversion from '' to '' may change value
	list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-cast-qual" ) # cast from type '' to type '' casts away qualifiers
	#list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-implicit-fallthrough" ) # this statement may fall through
	#list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-format-truncation" ) # '' directive output may be truncated writing up to A bytes into a region of size between B and C


	string( REPLACE ";" " " ${PROJECT_NAME}_C_FLAGS_STR "${${PROJECT_NAME}_C_FLAGS}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_C_FLAGS_STR "${${PROJECT_NAME}_C_FLAGS_STR}" ) #

	set( CMAKE_C_FLAGS ${${PROJECT_NAME}_C_FLAGS_STR} )

	# C release
	set( ${PROJECT_NAME}_C_FLAGS_RELEASE ${CMAKE_C_FLAGS_RELEASE} )

	## list( APPEND ${PROJECT_NAME}_C_FLAGS_RELEASE "-W" ) #
	list( APPEND ${PROJECT_NAME}_C_FLAGS_RELEASE "-Wno-maybe-uninitialized" ) # '' may be used uninitialized

	string( REPLACE ";" " " ${PROJECT_NAME}_C_FLAGS_RELEASE_STR "${${PROJECT_NAME}_C_FLAGS_RELEASE}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_C_FLAGS_RELEASE_STR "${${PROJECT_NAME}_C_FLAGS_RELEASE_STR}" ) #

	set( CMAKE_C_FLAGS_RELEASE ${${PROJECT_NAME}_C_FLAGS_STR} )

	# C++
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	## list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-W" ) #
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-conversion" ) # conversion from '' to '' may change value
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-unused-parameter" ) # unused parameter ''
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-shadow" ) # declaration of '' shadows a previous local
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-implicit-fallthrough" ) # this statement may fall through
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-cast-qual" ) # cast from type '' {aka ''} to type '' {aka ''} casts away qualifiers

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) #

	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )

	# C++
	set( ${PROJECT_NAME}_CXX_FLAGS_RELEASE ${CMAKE_CXX_FLAGS_RELEASE} )

	## list( APPEND ${PROJECT_NAME}_CXX_FLAGS_RELEASE "-W" ) #
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS_RELEASE "-Wno-inline" ) # inlining failed in call to '' call is unlikely and code size would grow

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_RELEASE_STR "${${PROJECT_NAME}_CXX_FLAGS_RELEASE}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_CXX_	FLAGS_RELEASE_STR "${${PROJECT_NAME}_CXX_FLAGS_RELEASE_STR}" ) #

	set( CMAKE_CXX_FLAGS_RELEASE ${${PROJECT_NAME}_CXX_FLAGS_RELEASE_STR} )

else()
	message( SEND_ERROR "[JSD] ${JSD_SSC_FULL_NAME} COMPILER SETTINGS: ${JSD_SSC_FULL_NAME}-linux-compiler-settings.cmake is included while not on linux" )

endif()

JSD_CMAKE_CURRENT_FILE_OUT( "${JSD_SSC_FULL_NAME}-linux-compiler-settings.cmake" )
