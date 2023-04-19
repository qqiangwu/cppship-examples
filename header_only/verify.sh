#! /bin/bash

set -e

test ! -f build/debug/libheader_only.a
test -x build/debug/add_test
test -x build/debug/sub_add_test

cppship test