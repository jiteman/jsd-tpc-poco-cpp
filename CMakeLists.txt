cmake_minimum_required( VERSION 3.16.3 )

project( tpc-poco-cpp ) # separate source component


JSD_SHOW_PROJECT_GROUP_HEADER()


set( JSD_SSC_CMAKE_PATH ${PROJECT_SOURCE_DIR}/0-tpc-cmake )
set( JSD_SSC_SOURCE_PATH ${PROJECT_SOURCE_DIR}/1-tpc-repository )


add_subdirectory( 2-tpc-poco-foundation )
add_subdirectory( 3-tpc-poco-json )
add_subdirectory( 4-tpc-poco-xml )
add_subdirectory( 5-tpc-poco-util )
add_subdirectory( 6-tpc-poco-zip )
add_subdirectory( 7-tpc-poco-seven-zip )


JSD_SHOW_PROJECT_GROUP_FOOTER()

