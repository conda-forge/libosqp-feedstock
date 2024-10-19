#!/bin/sh
set -ex

mkdir build && cd build

cmake -G Ninja \
    ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_MKL_PARDISO=OFF \
    -DOSQP_RESPECT_BUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DUNITTESTS:BOOL=ON \
    ..

cmake --build .
cmake --install .
