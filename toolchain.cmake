SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)


set(CMAKE_SYSROOT /home/docker/rpi-rootfs)
set(CMAKE_STAGING_PREFIX /home/docker/stage)

set(tools /home/docker/rpi-toolchain/toolchain-raspbian-buster-0-2-g62cd2c5-x86_64-arm-linux-gnueabihf)
SET(CMAKE_C_COMPILER ${tools}/bin/arm-unknown-linux-gnueabi-gcc)
SET(CMAKE_CXX_COMPILER ${tools}/bin/arm-unknown-linux-gnueabi-g++)
SET(CMAKE_FIND_ROOT_PATH ${tools})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

