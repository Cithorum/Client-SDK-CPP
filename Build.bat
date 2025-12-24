@echo off

rem Set environment to current .bat directory
pushd "%~dp0"

rem Install vcpkg if the folder doesn't exist
if not exist .\vcpkg\ (
  echo "Toolchain folder: 'vcpkg' does not exist! Brb making it for you..."
  rem From: https://vcpkg.io/en/getting-started.html
  git clone https://github.com/Microsoft/vcpkg.git
  .\vcpkg\bootstrap-vcpkg.bat -disableMetrics
  
) else (
  rem vcpkg was already installed previously and we can skip it :)
  echo "Toolchain folder 'vcpkg' found!"
)

set CL_EXE="C:\Program Files\LLVM\bin\clang-cl.exe"

cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=%CL_EXE% -DCMAKE_CXX_COMPILER=%CL_EXE% -S %cd% -B %cd%/Build/Release

rem Build the source code!
cd Build/Release
ninja