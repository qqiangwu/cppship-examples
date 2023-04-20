#! /bin/bash

set -e

test -x build/debug/multi_bins
test -x build/debug/bin1
test -x build/debug/bin2

test "$(cppship run --bin bin1 | tail -n1)" = "bin1"
test "$(cppship run --bin bin2 | tail -n1)" = "bin2"
test "$(cppship run --bin multi_bins | tail -n1)" = "main"