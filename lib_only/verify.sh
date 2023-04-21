#! /bin/bash

set -e

cppship build
test -f build/debug/liblib_only.a
test ! -f build/debug/add_test
test ! -f build/debug/sub_add_test

cppship test
test -x build/debug/add_test
test -x build/debug/sub_add_test