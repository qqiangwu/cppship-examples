#! /bin/bash

set -e

test -x build/debug/bin_only
test "$(build/debug/bin_only)" = "Hello cppship"