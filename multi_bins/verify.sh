#! /bin/bash

set -e

# cppship build
cppship build
test -x build/debug/multi_bins
test -x build/debug/bin1
test -x build/debug/bin2

# cppship run
test "$(cppship run -q --bin bin1)" = "bin1"
test "$(cppship run -q --bin bin2)" = "bin2"
test "$(cppship run -q --bin multi_bins)" = "main"

# cppship install
if $(python3 ../cppship_version_less.py 0.8.1)
then
    echo "cppship version too low: $(cppship --version)"
    exit 0;
fi

test ! -f /usr/local/bin/bin1
test ! -f /usr/local/bin/bin2
test ! -f /usr/local/bin/multi_bins

echo $(cppship install --bin abc) | grep "specified binary abc is not found$"
cppship install --bin bin1
test -x /usr/local/bin/bin1
test ! -f /usr/local/bin/bin2
test ! -f /usr/local/bin/multi_bins

sudo cppship install
test -x /usr/local/bin/bin1
test -x /usr/local/bin/bin2
test -x /usr/local/bin/multi_bins
