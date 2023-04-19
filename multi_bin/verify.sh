#! /bin/bash

set -e

test -x build/debug/multi_bin
test -x build/debug/bin1
test -x build/debug/bin2

test "$(build/debug/bin1)" = "bin1"
test "$(build/debug/bin2)" = "bin2"
test "$(build/debug/multi_bin)" = "main"