#! /bin/bash

set -e

for dir in */;
do
    echo "test cppship in ${dir}"
    cd ${dir}
    cppship build
    bash verify.sh
    cd ..
done