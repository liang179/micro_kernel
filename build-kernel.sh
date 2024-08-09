#!/bin/sh
set KERNEL_VERSION='6.10.3'

sudo apt update
sudo apt install flex bc bison libelf-dev
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.10.3.tar.xz
tar -xf linux-6.10.3.tar.xz
cd linux-6.10.3
make defconfig
make -j $(nproc) bzImage
cp arch/x86/boot/bzImage ../bzImage