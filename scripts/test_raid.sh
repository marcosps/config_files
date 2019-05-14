#!/bin/bash

raid1() {
	mdadm --create /dev/md01 --level=1 --raid-devices=2 /dev/loop[12]
	mkfs.ext4 /dev/md01  >/dev/null
	mount /dev/md01 /tmp/raid1
	touch /tmp/raid1/bla
}

raid10() {
	mdadm --create /dev/md10 --level=10 --raid-devices=4 /dev/loop[3456]
	mkfs.ext4 /dev/md10  >/dev/null
	mount /dev/md10 /tmp/raid10
	touch /tmp/raid10/bla
}

mkdir /tmp/raid{1,10}

# create disks of 50M each
for i in `seq 6`
do
	dd if=/dev/zero of=/tmp/disk$i bs=1024k count=50 2>/dev/null
	losetup /dev/loop$i /tmp/disk$i
done

raid1
raid10

ls -R /tmp/raid*
