cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

include(FetchContent)

message("INSTALLING DEPENDENCIES")
set(EXTERNAL_DIR ${CMAKE_CURRENT_LIST_DIR} CACHE PATH "")
message(" EXTERNAL DIR " ${EXTERNAL_DIR})



#

# Prefer pthread over system thread - DEVONO stare prima del find_package!
set(CMAKE_THREAD_PREFER_PTHREAD TRUE)
set(THREADS_PREFER_PTHREAD_FLAG TRUE)
find_package(Threads REQUIRED)

#
# FMT
#
FetchContent_Declare(
  extern_fmt
  GIT_REPOSITORY git@github.com:fmtlib/fmt.git
  GIT_TAG        6b219a58db753ae415fbd76ac076ff90630764cd
)


FetchContent_GetProperties(extern_fmt)
if(NOT extern_fmt)
  FetchContent_Populate(extern_fmt)
  add_subdirectory(
    ${extern_fmt_SOURCE_DIR}
    ${extern_fmt_BINARY_DIR}
    EXCLUDE_FROM_ALL)
endif()

#
# SPDLOG
#
FetchContent_Declare(
  extern_spdlog
  GIT_REPOSITORY https://github.com/gabime/spdlog.git
  GIT_TAG        v1.6.0
)


FetchContent_GetProperties(extern_spdlog)
if(NOT extern_spdlog)
  FetchContent_Populate(extern_spdlog)
  set(SPDLOG_FMT_EXTERNAL  ON CACHE INTERNAL "")
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
  GIT_TAG        2.3.8
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
