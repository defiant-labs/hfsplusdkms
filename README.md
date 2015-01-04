HFS+ DKMS
=========

HFSplusdkms is a native Linux kernel driver which adds journaling, 
therefore completes the support for Apple's HFS+ filesystem on Linux

This is a fork of https://github.com/reporter123/hfsplusdkms

The homepage of the original project: https://launchpad.net/hfsplusdkms

Use with real partitions at your own risk

USAGE
=====

	make clean
	make -j 3
	sudo rmmod hfsplus
	sudo insmod ./hfsplus.ko

DEBUG
=====

	mkdir -p test
    dd if=/dev/zero of=test/hfsplus.partition bs=99M count=1
    mkfs.hfsplus test/hfsplus.partition
    mkdir test/mnt
    sudo mount -o loop -t hfsplus test/hfsplus.partition test/mnt/

TIP: `hfsprogs` suite is needed to create a test HFS+ block file on Linux

