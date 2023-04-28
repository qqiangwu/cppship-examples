#! /bin/bash

set -e

test $(cppship run -q) = "okay"