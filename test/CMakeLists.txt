add_library(doctest_main STATIC doctest_main.cpp)
target_link_libraries(doctest_main PUBLIC doctest::doctest)

add_executable(tests tests.cpp)
target_link_libraries(tests PRIVATE project_warnings project_options
doctest_main)

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