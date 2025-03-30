#! /bin/bash

set -e

version=$(cppship --version)
if [[ ${version} < 0.8 ]];
then
    echo "cppship version too low: ${version}"
    exit 0;
fi

cppship build
test -f build/debug/dep
test -f build/debug/header_only_dep
test -f build/debug/cppship_dep
test -f build/debug/libsimple_lib_lib.a
