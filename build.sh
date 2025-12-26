#!/bin/bash
set -euo pipefail

# Set environment to current .sh directory
export THIS_SHELL_SCRIPT_FULL_PATH=$(readlink -f "$0")
export THIS_SHELL_SCRIPT_DIR=$(dirname "$THIS_SHELL_SCRIPT_FULL_PATH")
cd "${THIS_SHELL_SCRIPT_DIR}"

CLANGC=clang
CLANGCXX=clang++

# Set source code directory and build output directory, and generate the ninja files necessary for building
cmake_args="-GNinja\
 -DCMAKE_BUILD_TYPE=Release\
 -DCMAKE_C_COMPILER=${CLANGC}\
 -DCMAKE_CXX_COMPILER=${CLANGCXX}\
 -S ${PWD}\
 -B ${PWD}/Build/Release\
"
cmake $cmake_args

# Build the source code!
cd Build/Release
ninja