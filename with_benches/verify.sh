#! /bin/bash

set -e

cppship build
test ! -f build/debug/a_bench
test ! -f build/debug/b_bench

test "$(cppship bench -q a)" = "bench_a_1"
test ! -f build/debug/a_bench
test ! -f build/debug/b_bench
test -x build/release/a_bench
test ! -f build/release/b_bench

test "$(cppship bench -q b)" = "bench_b_1"
test ! -f build/debug/a_bench
test ! -f build/debug/b_bench
test -x build/release/a_bench
test -x build/release/b_bench

rm -rf build
cppship build --benches
test -x build/debug/a_bench
test -x build/debug/b_bench
test ! -f build/release/a_bench
test ! -f build/release/b_bench

test "$(cppship bench -q)" = "bench_a_1bench_b_1"