#!/bin/bash

NDK=/data/ndk
SYSROOT=$NDK/sysroot
CROSS_PREFIX=$NDK/bin/i686-linux-android-
ARCH=x86
CPU=x86
ADDITIONAL_CONFIGURE_FLAG=
PREFIX=`pwd`/../out/$ARCH

function build_one
{
../ffmpeg/configure \
  --prefix=$PREFIX \
  --enable-shared \
  --enable-debug \
  --disable-stripping \
  --disable-static \
  --disable-doc \
  --disable-ffmpeg \
  --disable-ffplay \
  --disable-ffprobe \
  --disable-ffserver \
  --disable-doc \
  --disable-symver \
  --enable-small \
  --disable-yasm \
  --cross-prefix=$CROSS_PREFIX \
  --target-os=android \
  --arch=$ARCH \
  --cpu=$CPU \
  --enable-cross-compile \
  --sysroot=$SYSROOT \
  --extra-cflags="-Os -fpic" \
$ADDITIONAL_CONFIGURE_FLAG
make clean
make -j5
make install
}

mkdir ./build; pushd ./build
build_one &&
popd && rm -fr ./build
