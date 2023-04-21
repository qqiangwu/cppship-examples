#! /bin/bash

set -e

cppship build
test -x build/debug/bin_only
test "$(cppship run -q)" = "Hello cppship"

test ! -f build/release/bin_only

cppship build -r
test -x build/release/bin_only
test "$(cppship run -q -r)" = "Hello cppship"