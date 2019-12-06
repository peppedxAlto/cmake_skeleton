project(solette)

cmake_minimum_required(VERSION 3.5)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Useful for editor to configure tag and stuff like that
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(smflexCli src/main.cpp)


