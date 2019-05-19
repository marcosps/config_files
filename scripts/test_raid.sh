#!/bin/bash

raid() {
	LEVEL=$1
	NDEVS=$2
	DEVICES=$3

	mkdir /tmp/raid$LEVEL
	mdadm --quiet --create /dev/md$LEVEL --force --level $LEVEL --metadata=0.90 --raid-devices=$NDEVS $DEVICES 2>/dev/null 1>&2
	mkfs.ext4 /dev/md$LEVEL  2>/dev/null 1>&2
	mount /dev/md$LEVEL /tmp/raid$LEVEL

	touch /tmp/raid$LEVEL/bla
	ls /tmp/raid$LEVEL

	umount /dev/md$LEVEL
	mdadm --stop /dev/md$LEVEL 2>/dev/null 1>&2

	for dev in "$DEVICES"
	do
		wipefs --all $dev 2>/dev/null 1>&2
	done
}

# create disks of 50M each
for i in `seq 6`
do
	dd if=/dev/zero of=/tmp/disk$i bs=1024k count=50 2>/dev/null
	losetup /dev/loop$i /tmp/disk$i
done

raid 0 2 "$(ls /dev/loop[12])"
raid 1 2 "$(ls /dev/loop[12])"
raid 10 4 "$(ls /dev/loop[1234])"
