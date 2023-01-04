@echo on

mkdir build
cd build

cmake -G "Ninja" ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_LIBDIR=lib ^
    -DENABLE_MKL_PARDISO=OFF ^
    -DOSQP_RESPECT_BUILD_SHARED_LIBS:BOOL=ON ^
    -DBUILD_SHARED_LIBS=ON ^
    ..
if %ERRORLEVEL% neq 0 exit 1

:: Build.
cmake --build . --config Release
if %ERRORLEVEL% neq 0 exit 1

:: Install.
cmake --install .
if %ERRORLEVEL% neq 0 exit 1
