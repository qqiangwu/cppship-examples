#! /bin/bash

set -e

cppship build
test ! -f build/debug/tests/test_only_a_test

cppship test
test -x build/debug/tests/test_only_a_test

rm -rf build
cppship build --tests
test -x build/debug/tests/test_only_a_test

rm -rf build
cppship test c | grep 'test `c` not found'
cppship test -q b1 | grep "b1"

out=$(cppship test -q -R b)
echo $out | grep "b1_test.*Passed"
echo $out | grep "b2_test.*Passed"