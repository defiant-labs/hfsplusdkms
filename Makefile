#
# Makefile for the Linux HFS+ filesystem driver
#

ifneq ($(KERNELRELEASE),) # part of the kernel tree

obj-$(CONFIG_HFSPLUS_FS) += hfsplus.o

hfsplus-objs := super.o options.o inode.o ioctl.o extents.o catalog.o dir.o btree.o \
		bnode.o brec.o bfind.o tables.o unicode.o wrapper.o bitmap.o part_tbl.o journal.o \
		attributes.o xattr.o xattr_user.o xattr_security.o xattr_trusted.o

hfsplus-$(CONFIG_HFSPLUS_FS_POSIX_ACL) += posix_acl.o

else # stand-alone

KDIR := /lib/modules/$(shell uname -r)/kernel/fs/hfsplus
KDIR := /home/Soft/Linux/linux-3.16.7
# KDIR := /lib/modules/$(shell uname -r)/build

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

# modules_prepare:
# 	$(MAKE) O=$(KDIR) M=$(PWD) modules_prepare

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

help:
	$(MAKE) -C $(KDIR) M=$(PWD) help

install: hfsplus.ko
	rm -f ${KDIR}/hfsplus.ko
	install -m644 -b -D hfsplus.ko ${KDIR}/hfsplus.ko

uninstall:
	rm ${KDIR}/hfsplus.ko

endif

