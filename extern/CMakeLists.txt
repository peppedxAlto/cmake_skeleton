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
  GIT_TAG        7.1.2 
)
FetchContent_MakeAvailable(extern_fmt)

#
# SPDLOG
#
FetchContent_Declare(
  extern_spdlog
  GIT_REPOSITORY https://github.com/gabime/spdlog.git
  GIT_TAG        v1.8.1
)
FetchContent_MakeAvailable(extern_spdlog)

#
# SPDLOG
#
FetchContent_Declare(
  extern_catch
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG        v3.0.0-preview3
)
FetchContent_MakeAvailable(extern_catch)

message("INSTALLING DEPENDENCIES DONE")
