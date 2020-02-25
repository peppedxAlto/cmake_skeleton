cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

include(FetchContent)

message("INSTALLING DEPENDENCIES")
set(EXTERNAL_DIR ${CMAKE_CURRENT_LIST_DIR} CACHE PATH "")
message(" EXTERNAL DIR " ${EXTERNAL_DIR})



#
# SPDLOG
#
FetchContent_Declare(
  extern_spdlog
  GIT_REPOSITORY https://github.com/gabime/spdlog.git
  GIT_TAG        v1.5.0
)


FetchContent_GetProperties(extern_spdlog)
if(NOT extern_spdlog)
  FetchContent_Populate(extern_spdlog)
  add_subdirectory(
    ${extern_spdlog_SOURCE_DIR}
    ${extern_spdlog_BINARY_DIR}
    EXCLUDE_FROM_ALL)
endif()

#
# SPDLOG
#
FetchContent_Declare(
  extern_doctest
  GIT_REPOSITORY https://github.com/onqtam/doctest.git
  GIT_TAG        2.3.7
)


FetchContent_GetProperties(extern_doctest)
if(NOT extern_doctest)
  FetchContent_Populate(extern_doctest)
  add_subdirectory(
    ${extern_doctest_SOURCE_DIR}
    ${extern_doctest_BINARY_DIR}
    EXCLUDE_FROM_ALL)
endif()
include (${extern_doctest_SOURCE_DIR}/scripts/cmake/doctest.cmake)


message("INSTALLING DEPENDENCIES DONE")
