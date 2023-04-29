#! /bin/bash

set -e

cppship cmake
cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug
cmake --build build

test $(build/cmake_gen) = "0.1.0"