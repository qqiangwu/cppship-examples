#! /bin/bash

set -e

test -x build/debug/dep
test "$(cppship run | tail -n1)" = "fmtlib"