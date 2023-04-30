#! /bin/bash

set -e
cppship build
test $(cppship run -q) = "ans-7"

cppship cmake
cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug
cmake --build build
