#! /bin/bash

set -e

cppship build
test ! -f build/debug/a_test

cppship test
test -x build/debug/a_test

rm -rf build
cppship build --tests
test -x build/debug/a_test