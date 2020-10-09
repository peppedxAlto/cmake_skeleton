find_package(Git QUIET)
if(NOT BUILD_VERSION AND GIT_FOUND)
  execute_process(
    COMMAND ${GIT_EXECUTABLE} describe --abbrev=12 --always 
    WORKING_DIRECTORY                ${CMAKE_CURRENT_LIST_DIR}
    OUTPUT_VARIABLE                  BUILD_VERSION
    OUTPUT_STRIP_TRAILING_WHITESPACE
    ERROR_STRIP_TRAILING_WHITESPACE
    ERROR_VARIABLE                   stderr
    RESULT_VARIABLE                  return_code
  )
  if(return_code)
        message(STATUS "git describe failed: ${stderr};
    BUILD_VERSION is left undefined")
  elseif(CMAKE_VERBOSE_MAKEFILE)
      message(STATUS "git describe stderr: ${stderr}")
  endif()
endif()
