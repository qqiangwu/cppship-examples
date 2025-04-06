#! /bin/bash

set -e

if $(python3 cppship_version_less.py 0.8.2);
then
    git checkout c497441739a4db43672d496a5035daeaf8cf7f96
fi

for dir in */;
do
    echo "test cppship in ${dir}"
    cd ${dir}
    rm -rf build
    bash verify.sh
    cd ..
done