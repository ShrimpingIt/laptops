#!/bin/bash
# this is intended to be run from a lubuntu livecd (with sda partitions unmounted)
# and requires a drive attached with a mounted partition with volume label DATA 
# to store the snapshot of the whole device to a gzipped file which can be uncompressed 
# on a target laptop
# to get started from a livecd with all the tools you could get wifi connected and install like
# sudo apt-get install pigz pv git 


# it might be required to modify fstab to point 
# to device names (instead of ids) and change grub to disable uuids 
# then run update-grub before imaging the source laptop so that disk uuid changes
# don't prevent boot

GZIP=gzip
# pigz if you want to use multiple cores (increasing speed of compression/decompression)
#apt install pigz 
#GZIP=pigz

# pipeviewer can be added to the gzip pipe if you want progress
#apt install pv

# indicate the disk from which an image will be taken
DISK=sda

# retrieve the last 512byte sector of the last partition on the disk
COUNT512B=`fdisk -u -l /dev/${DISK} | tail -n1 | awk '{print $3;}'`

# recalculate count for 1024byte blocks (faster in dd)
COUNT1K="$(( $COUNT512B / 2 ))"

# write zeroes to swap area and reformat it fresh so it compresses easily
swapoff /dev/sda1
dd bs=1k if=/dev/zero of=/dev/sda1
mkswap /dev/sda1

# fill remainder of sda2 (root partition) also with zeroes
mkdir /media/lubuntu/main
mount /dev/sda2 /media/lubuntu/main/
dd bs=1k if=/dev/zero of=/media/lubuntu/main/filler
rm /media/lubuntu/main/filler
umount /media/lubuntu/main/
rmdir /media/lubuntu/main

# backup the partition tables, swap and root filesystem partitions as a complete byte sequence, ending with the last sector indicated from fdisk
dd if=/dev/${DISK} bs=1k conv=sync count="${COUNT1K}" | ${GZIP} --fast -c > /media/lubuntu/DATA/snapshot.iso.gz
