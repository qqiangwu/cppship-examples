#! /bin/bash

set -e

cppship build
test -x build/debug/samples
test ! -f build/debug/examples/samples_a_example
test ! -f build/debug/examples/samples_b_example
test ! -f build/debug/a_test

test "$(cppship run -q --example a)" = "example_a"
test -x build/debug/examples/samples_a_example
test ! -f build/debug/samples_b_example

test "$(cppship run -q --example b)" = "example_b"
test -x build/debug/examples/samples_a_example
test -x build/debug/examples/samples_b_example

test "$(cppship run -q --example c)" = "1"

rm -rf build
cppship build --examples
test -x build/debug/examples/samples_a_example
test -x build/debug/examples/samples_b_example
test ! -f build/debug/tests/samples_a_test
test ! -f build/debug/samples

rm -rf build
cppship build --examples --tests
test -x build/debug/examples/samples_a_example
test -x build/debug/examples/samples_b_example
test -x build/debug/tests/samples_a_test
test ! -f build/debug/samples

cppship build --examples --tests --bins -r
test -x build/release/examples/samples_a_example
test -x build/release/examples/samples_b_example
test -x build/release/tests/samples_a_test
test -x build/release/samples

cppship run --example xxx | grep 'example `xxx` not found'
cppship run --bin xxx | grep 'binary `xxx` not found'
cppship bench xxx | grep 'bench `xxx` not found'