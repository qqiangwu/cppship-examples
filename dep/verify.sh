#! /bin/bash

set -e

cppship build
test -x build/debug/dep
test "$(cppship run -q)" = "fmtlib"

cppship test