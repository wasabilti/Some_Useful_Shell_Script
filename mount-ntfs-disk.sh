#!/bin/bash

# Mount ntfs format disk partition on the desktop

read -p "Current mount point(eg. /Volume/Package), Enter if not mounted: " CUR_MP
read -p "Real partition path(eg. /dev/disk0s1): " RE_DEV
read -p "Mount name(eg. Package):" M_NAME
M_NAME=~/Desktop/$M_NAME


if [ -z $CUR_MP ]
then
	echo 'Not mounted'
else
	sudo umount $CUR_MP
fi

if [ ! -d $M_NAME ]
then
	mkdir ~/Desktop/$M_NAME
fi

if [ -z $M_NAME ]
then
	echo 'M_NAME is NULL'
else
	echo 'mount to ' $M_NAME
	sudo mount -t ntfs -o rw,auto,nobrowse $RE_DEV $M_NAME
fi
