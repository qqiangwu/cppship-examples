#! /bin/bash

set -e
set -x

function cleanup() {
    cmake --build build/debug --target clean
}

# cppship build
cppship build
test -x build/debug/dep
test -x build/debug/header_only_dep
test -x build/debug/cppship_dep
test -f build/debug/libsimple_lib_lib.a

cleanup
cppship build -p dep
test -x build/debug/dep
test ! -f build/debug/header_only_dep
test ! -f build/debug/cppship_dep
test ! -f build/debug/libsimple_lib_lib.a

cleanup
cppship build -p cppship_dep
test ! -f build/debug/dep
test ! -f build/debug/header_only_dep
test -x build/debug/cppship_dep
test -f build/debug/libsimple_lib_lib.a

cleanup
cppship build --examples
test -x build/debug/examples/cppship_dep_ex1_example
test -x build/debug/examples/dep_ex1_example
test -x build/debug/examples/dep_ex2_example

cleanup
cppship build --examples -p cppship_dep
test -x build/debug/examples/cppship_dep_ex1_example
test ! -f build/debug/examples/dep_ex1_example
test ! -f build/debug/examples/dep_ex2_example

cleanup
cppship build --tests
test -x build/debug/tests/cppship_dep_test-1_test
test -x build/debug/tests/dep_test-2_test
test -x build/debug/tests/cppship_dep_test-2_test
test -x build/debug/tests/cppship_dep_test-3_test
test -x build/debug/tests/dep_test-4_test

cleanup
cppship build --tests -p dep
test ! -f build/debug/tests/cppship_dep_test-1_test
test -x build/debug/tests/dep_test-2_test
test ! -f build/debug/tests/cppship_dep_test-2_test
test ! -f build/debug/tests/cppship_dep_test-3_test
test -x build/debug/tests/dep_test-4_test

cleanup
cppship build --benches
test -x build/debug/benches/cppship_dep_b1_bench
test -x build/debug/benches/cppship_dep_b2_bench
test -x build/debug/benches/dep_b1_bench
test -x build/debug/benches/dep_b2_bench

cleanup
cppship build --benches -p cppship_dep
test -x build/debug/benches/cppship_dep_b1_bench
test -x build/debug/benches/cppship_dep_b2_bench
test ! -f build/debug/benches/dep_b1_bench
test ! -f build/debug/benches/dep_b2_bench

cppship build --bins
test -x build/debug/dep
test -x build/debug/header_only_dep
test -x build/debug/cppship_dep
test -f build/debug/libsimple_lib_lib.a

cleanup
cppship build --bins -p dep
test -x build/debug/dep
test ! -f build/debug/header_only_dep
test ! -f build/debug/cppship_dep
test ! -f build/debug/libsimple_lib_lib.a

cleanup
cd dep && cppship build --bins && cd -
test -x build/debug/dep
test ! -f build/debug/header_only_dep
test ! -f build/debug/cppship_dep
test ! -f build/debug/libsimple_lib_lib.a

# cppship run
test "$(cppship run -q --bin dep)" = "dep"
test "$(cppship run -q --bin header_only_dep)" = "header_only_dep"
test "$(cppship run -q --bin cppship_dep)" = "ans-7"

# cppship test
out=$(cppship test -q)
echo $out | grep "cppship_dep_test-1_test"
echo $out | grep "cppship_dep_test-2_test"
echo $out | grep "cppship_dep_test-3_test"
echo $out | grep "dep_test-2_test"
echo $out | grep "dep_test-4_test"

out=$(cppship test -q -p dep)
echo $out | grep -v "cppship_dep_test-1_test"
echo $out | grep -v "cppship_dep_test-2_test"
echo $out | grep -v "cppship_dep_test-3_test"
echo $out | grep "dep_test-2_test"
echo $out | grep "dep_test-4_test"

out=$(cppship test -q -R test-2)
echo $out | grep "cppship_dep_test-2_test"
echo $out | grep "dep_test-2_test"
echo $out | grep -v "test-1_test"
echo $out | grep -v "test-3_test"
echo $out | grep -v "test-4_test"

out=$(cppship test -q -R test-2 -p dep)
echo $out | grep -v "cppship_dep_test-2_test"
echo $out | grep "dep_test-2_test"

# cppship install
echo "$(cppship install)" | grep -e "install for workspace is not supported$"
