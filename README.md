OpenWRT-Galileo
===============

OpenWRT for Intel Galileo Board 

OpenWRT version: git-svn-id: svn://svn.openwrt.org/openwrt/trunk@42607

How to Build?

running "make V=99 " to build the OpenWRT firmware for Intel Galileo.
When build finished, the kernel image and cross-compiler can be found in the following directory:

The kernel image: " /../build_dir/target-i386_i486_uClibc-0.9.33.2/linux-x86_galileo "

The cross-compiler: " /../staging_dir/toolchain-i386_i486_gcc-4.8-linaro_uClibc-0.9.33.2/"

======================

How to work?

put the following files to your tf card:
Root folder:

/boot/grub/grub.conf

/bzImage

/grub.efi

/openwrt-x86-galileo-rootfs.cpio.gz

===================

Notes:

（1）”bzImage”  is in the directory of "build_dir/target-i386_i486_uClibc-0.9.33.2/linux-x86_galileo"

（2） the root filesystem  "openwrt-x86-galileo-rootfs.cpio.gz"  is in the directory of "bin/x86"

（3）"boot" and "grub.efi" are from the intel galileo web http://www.intel.com/support/galileo/sb/CS-035101.htm , download the "SD-Card Linux Image".
And you should modify the "grub.conf" as follow:


default 1
timeout 1

color white/blue white/cyan

title Clanton SVP kernel-SPI initrd-SPI IMR-On IO-APIC/HPET NoEMU
    kernel --spi root=/dev/ram0 console=ttyS1,115200n8 earlycon=uart8250,mmio32,$EARLY_CON_ADDR_REPLACE,115200n8 reboot=efi,warm apic=debug rw
    initrd --spi

title Clanton SVP kernel-MassStorage initrd-MassStorage image-full IMR-On IO-APIC/HPET NoEMU debug
    root (hd0,0)
    kernel /bzImage root=/dev/ram0 init=/init console=ttyS1,115200n8 earlycon=uart8250,mmio32,$EARLY_CON_ADDR_REPLACE,115200n8 reboot=efi,warm apic=debug rw LABEL=boot debugshell=5 rootimage=
    initrd /openwrt-x86-galileo-rootfs.cpio.gz
 

