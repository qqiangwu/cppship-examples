#! /bin/bash

set -e

test -x build/debug/bin_only
test "$(cppship run | tail -n1)" = "Hello cppship"