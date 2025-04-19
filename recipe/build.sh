#!/bin/sh
set -ex

mkdir build && cd build

cmake -G Ninja \
    ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DOSQP_ALGEBRA_BACKEND=builtin \
    -DOSQP_BUILD_UNITTESTS:BOOL=ON \
    -DOSQP_BUILD_SHARED_LIB:BOOL=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DOSQP_BUILD_STATIC_LIB:BOOL=OFF \
    -DOSQP_CODEGEN:BOOL=OFF \
    ..

cmake --build .
cmake --install .
