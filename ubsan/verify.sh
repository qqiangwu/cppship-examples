#! /bin/bash

set -e

cppship build -d -q
grep "\-fsanitize=leak" build/compile_commands.json
grep "\-fsanitize=undefined" build/compile_commands.json
grep "\-fsanitize=address" build/compile_commands.json