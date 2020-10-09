#include "spdlog/spdlog.h"
#include "version.h"
int main()
{
  //Use the default logger (stdout, multi-threaded, colored)
  spdlog::info("Hello, {} {}!", "World", BUILD_VERSION);
}