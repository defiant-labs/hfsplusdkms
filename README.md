HFS+ DKMS
=========

HFSplusdkms is an expermintal native kernel module to add journaling, and 
therefore complete the implementation of Apple's HFS+ support on Linux-based systems

This is a development/debugging fork of https://github.com/reporter123/hfsplusdkms

Homepage of the original project: https://launchpad.net/hfsplusdkms

Use with real partitions at your own risk

INSTALL
=======

# WARNING: will reinstall your current hfsplus Linux driver (in case you have one)
# Please make sure to back it up before overwriting it with this driver

	make clean
	make -j 3
	sudo make install

USAGE
=====

	sudo rmmod hfsplus
	sudo depmod
	sudo modprobe hfsplus

DEBUG
=====

# TIP: hfsprogs suite is needed to create a test HFS+ filesystem block file on Linux

	mkdir -p test
    dd if=/dev/zero of=test/hfsplus.partition bs=99M count=1
    mkfs.hfsplus test/hfsplus.partition
    mkdir test/mnt
    sudo mount -o loop -t hfsplus test/hfsplus.partition test/mnt/
