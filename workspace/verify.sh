#! /bin/bash

set -e
set -x

if $(python3 ../cppship_version_less.py 0.8)
then
    echo "cppship version too low: $(cppship --version)"
    exit 0;
fi

function cleanup() {
    cmake --build build/debug --target clean
}

# cppship build
cppship build
test -x build/debug/dep
test -x build/debug/header_only_dep
test -x build/debug/cppship_dep
test -f build/debug/libsimple_lib_lib.a

if $(python3 ../cppship_version_less.py 0.8.1)
then
    echo "cppship version too low: $(cppship --version)"
    exit 0;
fi

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
test -x build/debug/examples/ex1
test -x build/debug/examples/ex2

cleanup
cppship build --examples -p cppship_dep
test -x build/debug/examples/ex1
test ! -f build/debug/examples/ex2

cleanup
cppship build --tests
test -x build/debug/test-1_test
test -x build/debug/test-2_test
test -x build/debug/test-2x_test
test -x build/debug/test-3_test
test -x build/debug/test-4_test

cleanup
cppship build --tests -p dep
test ! -f build/debug/test-1_test
test -x build/debug/test-2_test
test ! -f build/debug/test-2x_test
test ! -f build/debug/test-3_test
test -x build/debug/test-4_test

cleanup
cppship build --benches
test -x build/debug/b1_bench
test -x build/debug/b2_bench

cleanup
cppship build --benches -p cppship_dep
test -x build/debug/b1_bench
test ! -f build/debug/b2_bench

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
echo $out | grep "test-1_test"
echo $out | grep "test-2_test"
echo $out | grep "test-2x_test"
echo $out | grep "test-3_test"
echo $out | grep "test-4_test"

out=$(cppship test -q -p dep)
echo $out | grep "test-2_test"
echo $out | grep -v "test-1_test"

out=$(cppship test -q -R test-2)
echo $out | grep "test-2_test"
echo $out | grep "test-2x_test"
echo $out | grep -v "test-3_test"
echo $out | grep -v "test-4_test"

out=$(cppship test -q -R test-2 -p dep)
echo $out | grep "test-2_test"
echo $out | grep -v "test-2x_test"