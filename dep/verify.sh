#! /bin/bash

set -e

test -x build/debug/dep
test "$(build/debug/dep)" = "fmtlib"