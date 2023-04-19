#! /bin/bash

set -e

test -x build/debug/full
test -f build/debug/libfull.a
test "$(build/debug/full)" = "full"