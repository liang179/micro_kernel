#!/bin/sh

wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2
tar -jxf busybox-1.36.1.tar.bz2
cd busybox-1.36.1
make defconfig
sed -i "s/# CONFIG_STATIC is not set/CONFIG_STATIC=y/g" .config
sed -n "/CONFIG_STATIC=/p" .config
make -j $(nproc)
make install

cd ..
mkdir -p initramfs/bin initramfs/sbin initramfs/etc initramfs/proc initramfs/sys initramfs/dev initramfs/usr/bin initramfs/usr/sbin
cp -a busybox-1.36.1/_install/* ./initramfs
cp init initramfs/init
chmod +x initramfs/init
tree initramfs

sudo apt update
sudo apt install cpio
cd initramfs
find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../initramfs.cpio.gz