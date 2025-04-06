#! /bin/bash

set -e

cppship build
test -x build/debug/a
test ! -f build/debug/examples/a

cppship build --examples
test -x build/debug/a

test -x build/debug/examples/bin_samples_a_example
test -x build/debug/examples/bin_samples_bin_samples_example

test "$(cppship run -q --bin a)" = "bin_a"
test "$(cppship run -q --example a)" = "example_a"
test "$(cppship run -q --example bin_samples)" = "example_main"