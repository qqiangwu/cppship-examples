#! /bin/bash

set -e

cppship build
test -f build/debug/liblib_only.a
test ! -f build/debug/tests/lib_only_add_test
test ! -f build/debug/tests/lib_only_sub_add_test

cppship test
test -x build/debug/tests/lib_only_add_test
test -x build/debug/tests/lib_only_sub_add_test