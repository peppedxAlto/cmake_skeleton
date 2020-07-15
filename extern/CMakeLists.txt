cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

include(FetchContent)

message("INSTALLING DEPENDENCIES")
set(EXTERNAL_DIR ${CMAKE_CURRENT_LIST_DIR} CACHE PATH "")
message(" EXTERNAL DIR " ${EXTERNAL_DIR})

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
  GIT_TAG        7.0.1 
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
  GIT_TAG        v1.7.0
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
  extern_catch
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG        v3.0.0-preview2
)


FetchContent_GetProperties(extern_catch)
if(NOT extern_catch)
  FetchContent_Populate(extern_catch)
  add_subdirectory(
    ${extern_catch_SOURCE_DIR}
    ${extern_catch_BINARY_DIR}
    EXCLUDE_FROM_ALL)
endif()


message("INSTALLING DEPENDENCIES DONE")
