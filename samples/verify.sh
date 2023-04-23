#! /bin/bash

set -e

cppship build
test -x build/debug/samples
test ! -f build/debug/examples/a
test ! -f build/debug/examples/b
test ! -f build/debug/a_test

test "$(cppship run -q --example a)" = "example_a"
test -x build/debug/examples/a
test ! -f build/debug/b

test "$(cppship run -q --example b)" = "example_b"
test -x build/debug/examples/a
test -x build/debug/examples/b

test "$(cppship run -q --example c)" = "1"

rm -rf build
cppship build --examples
test -x build/debug/examples/a
test -x build/debug/examples/b
test ! -f build/debug/a_test
test ! -f build/debug/samples

rm -rf build
cppship build --examples --tests
test -x build/debug/examples/a
test -x build/debug/examples/b
test -x build/debug/a_test
test ! -f build/debug/samples

cppship build --examples --tests --bins -r
test -x build/release/examples/a
test -x build/release/examples/b
test -x build/release/a_test
test -x build/release/samples