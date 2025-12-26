@echo off

rem Set environment to current .bat directory
pushd "%~dp0"

set CL_EXE="C:\Program Files\LLVM\bin\clang-cl.exe"

cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=%CL_EXE% -DCMAKE_CXX_COMPILER=%CL_EXE% -S %cd% -B %cd%/Build/Release

rem Build the source code!
cd Build/Release
ninja