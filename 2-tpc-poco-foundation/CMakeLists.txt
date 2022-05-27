cmake_minimum_required( VERSION 3.16.3 )

project( jsd-tpc-poco-foundation C CXX )


JSD_SHOW_PROJECT_HEADER()


include( ${JSD_SSC_CMAKE_PATH}/tpc-poco-foundation-set-compiler-settings.cmake )
include( ${JSD_SSC_CMAKE_PATH}/functions-and-macroses/tpc-poco-functions-and-macroses.cmake )
set( JSD_THIS_PROJECT_SOURCES_ROOT_PATH ${JSD_SSC_SOURCE_PATH}/poco/Foundation )
set( JSD_THIS_PROJECT_HEADER_PATH ${JSD_THIS_PROJECT_SOURCES_ROOT_PATH}/include )
set( JSD_THIS_PROJECT_SOURCE_PATH ${JSD_THIS_PROJECT_SOURCES_ROOT_PATH}/src )
set( JSD_THIS_PROJECT_ADHOCS_PATH ${JSD_SSC_SOURCE_PATH}/jsd_adhocs )

set( ${PROJECT_NAME}_TEST_SOURCE_DIRS_VAR ${JMSD_THIS_PROJECT_SOURCE_ROOT}/testsuite/src )


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	${JSD_PLATFORM_SOURCES}
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

set( JSD_POCO_PLATFORM_FILES_TO_REMOVE
	"DirectoryIterator"
	"Environment"
	"Event"
	"File"
	"FileStream"
	"FPEnvironment"
	"LogFile"
	"Mutex"
	"NamedEvent"
	"NamedMutex"
	"Path"
	"PipeImpl"
	"Platform"
	"Process"
	"RWLock"
	"Thread"
	"Semaphore"
	"SharedLibrary"
	"SharedMemory"
	"Timezone" )
JSD_REMOVE_PLATFORM_FILES_FOR_POCO( header_and_source_files JSD_POCO_PLATFORM_FILES_TO_REMOVE )

set( JSD_POCO_PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE
	"AndroidLogChannel"
	"EventLogChannel"
	"SyslogChannel"
	"WindowsConsoleChannel" )

#list( APPEND JSD_POCO_PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "NamedTuple" )

if ( UNIX )
	list( REMOVE_ITEM JSD_POCO_PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "SyslogChannel" )
elseif( WIN32 )
	list( REMOVE_ITEM JSD_POCO_PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "EventLogChannel" )
	list( REMOVE_ITEM JSD_POCO_PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "WindowsConsoleChannel" )
endif()

JSD_REMOVE_FILES_FROM_THE_LIST( header_and_source_files JSD_POCO_PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE )

if( WIN32 )
	JSD_MICROSOFT_MESSAGE_COMPILER( header_and_source_files ${JSD_THIS_PROJECT_SOURCE_PATH}/pocomsg.mc )
endif()

add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	-DFoundation_EXPORTS
	-DPOCO_ENABLE_CPP11
	-DPOCO_DLL )
JSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	-DPOCO_NO_AUTOMATIC_LIBS
	-DPOCO_ENABLE_CPP11
	-DPOCO_DLL )
JSD_LIST_TO_STRING( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
JSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
add_definitions( "${${PROJECT_NAME}_BUILD_DEFINITIONS_VAR}" )


## required to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 0.1.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 0.1 )


## project target section
if( UNIX )
	set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
		"pthread"
		"dl"
		"rt" )
elseif ( WIN32 )
	set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
		"Iphlpapi.lib" )
endif()
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JSD_CMAKE_PATH}/set-expose-dependencies.cmake )
include( ${JSD_CMAKE_PATH}/set-expose-test-source-directories.cmake )
JSD_SHOW_PROJECT_FOOTER()
