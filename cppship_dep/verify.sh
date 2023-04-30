#! /bin/bash

set -e
cppship build
test $(cppship run -q) = "ans-7"