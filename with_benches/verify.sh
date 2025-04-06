#! /bin/bash

set -e
set -x

cppship build
test ! -f build/debug/benches/with_benches_a_bench
test ! -f build/debug/benches/with_benches_b_bench

test "$(cppship bench -q a)" = "bench_a_1"
test ! -f build/debug/benches/with_benches_a_bench
test ! -f build/debug/benches/with_benches_b_bench
test -x build/release/benches/with_benches_a_bench
test ! -f build/release/benches/with_benches_b_bench

test "$(cppship bench -q b)" = "bench_b_1"
test ! -f build/debug/benches/with_benches_a_bench
test ! -f build/debug/benches/with_benches_b_bench
test -x build/release/benches/with_benches_a_bench
test -x build/release/benches/with_benches_b_bench

rm -rf build
cppship build --benches
test -x build/debug/benches/with_benches_a_bench
test -x build/debug/benches/with_benches_b_bench
test ! -f build/release/benches/with_benches_a_bench
test ! -f build/release/benches/with_benches_b_bench

cppship bench -q | grep "bench_a_1bench_b_1"
cppship bench -q c | grep "BM_SomeFunction"