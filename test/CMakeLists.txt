add_executable(tests tests.cpp)
target_link_libraries(tests PRIVATE project_options Catch2WithMain fmt::fmt)

### automatically discover tests that are defined in catch based test files you
### can modify the unittests. TEST_PREFIX to whatever you want, or use different
### for different binaries
##doctest_discover_tests(
##  tests
##  TEST_PREFIX
##  "unittests."
##  EXTRA_ARGS
##  -s
##  --reporter=xml
##  --out=tests.xml)
add_test(NAME test_1 COMMAND tests)