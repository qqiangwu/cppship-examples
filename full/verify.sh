#! /bin/bash

set -e

test -x build/debug/full
test -f build/debug/libfull.a
test "$(cppship run | tail -n1)" = "full"