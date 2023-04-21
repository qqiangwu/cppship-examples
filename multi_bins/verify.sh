#! /bin/bash

set -e

test -x build/debug/multi_bins
test -x build/debug/bin1
test -x build/debug/bin2

test "$(cppship run -q --bin bin1)" = "bin1"
test "$(cppship run -q --bin bin2)" = "bin2"
test "$(cppship run -q --bin multi_bins)" = "main"