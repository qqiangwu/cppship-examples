#! /bin/bash

rm -rf build
rm -rf include
rm -rf src
mkdir src

# we have a binary first, then a header only lib is added
cat <<EOF > src/main.cpp
int main()
{
}
EOF

cppship run

cat <<EOF > src/main.cpp
#include <iostream>
#include "x.h"

int main()
{
    std::cout << foo();
}
EOF

mkdir include
cat <<EOF > include/x.h
int foo() { return 0; }
EOF

cppship run