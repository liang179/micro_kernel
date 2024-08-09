# micro_kernel

```bash
sudo apt install qemu-system-x86
qemu-system-x86_64 -kernel bzImage -initrd initramfs.cpio.gz -nographic -append "console=ttyS0"
```