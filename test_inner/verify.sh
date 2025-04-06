#! /bin/bash

set -e

cppship build
test -f build/debug/libtest_inner.a
test ! -f build/debug/tests/test_inner_inner_test
test ! -f build/debug/tests/test_inner_sub_inner_test

cppship test
test -x build/debug/tests/test_inner_inner_test
test -x build/debug/tests/test_inner_sub_inner_test