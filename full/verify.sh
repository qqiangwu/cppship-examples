#! /bin/bash

set -e

cppship build
test -x build/debug/full
test -f build/debug/libfull.a
test "$(cppship run -q)" = "full"

test ! -f build/debug/a_test

cppship test
test -x build/debug/a_test