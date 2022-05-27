cmake_minimum_required( VERSION 3.16.3 )

project( jsd-tpc-poco-seven-zip C CXX )


JSD_SHOW_PROJECT_HEADER()


include( ${JSD_SSC_CMAKE_PATH}/tpc-poco-seven-zip-set-compiler-settings.cmake )
set( JSD_THIS_PROJECT_SOURCES_ROOT_PATH ${JSD_SSC_SOURCE_PATH}/poco/Zip )
set( JSD_THIS_PROJECT_HEADER_PATH ${JSD_THIS_PROJECT_SOURCES_ROOT_PATH}/include )
set( JSD_THIS_PROJECT_SOURCE_PATH ${JSD_THIS_PROJECT_SOURCES_ROOT_PATH}/src )
set( JSD_THIS_PROJECT_ADHOCS_PATH ${JSD_SSC_SOURCE_PATH}/jsd_adhocs )


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	${JSD_PLATFORM_SOURCES}
	${jsd-tpc-poco-foundation_DEPENDENCY_DIRS}
	${JSD_THIS_PROJECT_HEADER_PATH} )

set( JSD_THIS_PROJECT_ADHOCS_DIRS ${JSD_THIS_PROJECT_ADHOCS_PATH}/common )

if( UNIX )
	list( APPEND JSD_THIS_PROJECT_ADHOCS_DIRS ${JSD_THIS_PROJECT_ADHOCS_PATH}/linux )
elseif ( WIN32 )
	list( APPEND JSD_THIS_PROJECT_ADHOCS_DIRS ${JSD_THIS_PROJECT_ADHOCS_PATH}/windows )
endif()

include_directories( ${JSD_THIS_PROJECT_ADHOCS_DIRS} )
## or
#list( APPEND ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR ${JSD_THIS_PROJECT_ADHOCS_DIRS} )

list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )


## this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files
	${JSD_THIS_PROJECT_HEADER_PATH}/*.h*
	${JSD_THIS_PROJECT_HEADER_PATH}/*.c*
	${JSD_THIS_PROJECT_SOURCE_PATH}/*.h*
	${JSD_THIS_PROJECT_SOURCE_PATH}/*.c* )

set( JSD_POCO_SEVEN_ZIP_FILES_TO_REMOVE
	"BraIA64.c"
	"Delta.c"
	"Delta.h"
	"LzFind.c"
	"LzFind.h"
	"LzFindMt.c"
	"LzFindMt.h"
	"Lzma2Enc.c"
	"Lzma2Enc.h"
	"Lzma86Enc.c"
	"LzmaEnc.c"
	"LzmaEnc.h"
	"LzmaLib.c"
	"LzmaLib.h"
	"MtCoder.c"
	"MtCoder.h"
	"Ppmd7Enc.c"
	"Sha256.c"
	"Sha256.h"
	"Threads.c"
	"Threads.h"
	"Xz.c"
	"XzCrc64.c"
	"XzCrc64.h"
	"XzDec.c"
	"XzEnc.c"
	"XzEnc.h"
	"Xz.h"
	"XzIn.c" )
JSD_REMOVE_FILES_FROM_THE_LIST( header_and_source_files JSD_POCO_SEVEN_ZIP_FILES_TO_REMOVE )
add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	${jsd-tpc-poco-foundation_LINK_DEFINITIONS}
	-DSevenZip_EXPORTS )
JSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	${jsd-tpc-poco-foundation_LINK_DEFINITIONS} )
JSD_LIST_TO_STRING( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
JSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
add_definitions( "${${PROJECT_NAME}_BUILD_DEFINITIONS_VAR}" )


## required to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 0.1.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 0.1 )


## project target section
set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
	${jsd-tpc-poco-foundation_DEPENDENCY_LIBS}
	jsd-tpc-poco-foundation )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JSD_CMAKE_PATH}/set-expose-dependencies.cmake )
JSD_SHOW_PROJECT_FOOTER()
