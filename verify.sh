#! /bin/bash

set -e

for dir in */;
do
    echo "test cppship in ${dir}"
    cd ${dir}
    rm -rf build
    bash verify.sh
    cd ..
done