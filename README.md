# skeleton readme

Adapted from https://github.com/lefticus/cpp_starter_project

cmake-format example
 cmake-format  -c .cmake-format.yaml -i src/CMakeLists.txt

Fish Alias for cninja
 abbr -a -U -- cninja 'cmake -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_C_FLAGS="-fuse-ld=lld -gsplit-dwarf" -DCMAKE_CXX_FLAGS="-fuse-ld=lld -gsplit-dwarf"'
