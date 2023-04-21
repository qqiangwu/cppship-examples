#! /bin/bash

set -e

cppship build
test -x build/debug/samples
test ! -f build/debug/a
test ! -f build/debug/b
test ! -f build/debug/a_test

test "$(cppship run -q --example a)" = "example_a"
test -x build/debug/a
test ! -f build/debug/b

test "$(cppship run -q --example b)" = "example_b"
test -x build/debug/a
test -x build/debug/b

rm -rf build
cppship build --examples
test -x build/debug/a
test -x build/debug/b
test ! -f build/debug/a_test
test ! -f build/debug/samples

rm -rf build
cppship build --examples --tests
test -x build/debug/a
test -x build/debug/b
test -x build/debug/a_test
test ! -f build/debug/samples

cppship build --examples --tests --bins -r
test -x build/release/a
test -x build/release/b
test -x build/release/a_test
test -x build/release/samples