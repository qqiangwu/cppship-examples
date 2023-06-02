#! /bin/bash

set -e

cppship build -d -q
grep "\-fsanitize=thread" build/compile_commands.json