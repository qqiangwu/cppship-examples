#! /bin/bash

set -e

cppship build
test -f build/debug/libtest_inner.a
test ! -f build/debug/inner_test
test ! -f build/debug/sub_inner_test

cppship test
test -x build/debug/inner_test
test -x build/debug/sub_inner_test