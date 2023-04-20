#! /bin/bash

set -e

test -f build/debug/libtest_inner.a
test -x build/debug/inner_test
test -x build/debug/sub_inner_test

cppship test