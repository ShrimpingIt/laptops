#!/bin/bash
GZIP=gzip
# pigz if you want to use multiple cores (increasing speed of compression/decompression)
#GZIP=pigz
# pipeviewer can be added to the gzip pipe if you want progress
#sudo apt-get install pv
DISK=sda
COUNT512B=`sudo fdisk -u -l /dev/${DISK} | tail -n1 | awk '{print $4;}'`
COUNT1MB="$(( $COUNT512B / 2048 ))"
# write zeroes to swap and fill remainder of sda5 (root partition) also with zeroes
sudo bash -c "dd bs=1M if=/dev/zero of=/dev/sda1; mkdir /media/lubuntu/main; mount /dev/sda5 /media/lubuntu/main/ && dd bs=1M if=/dev/zero of=/media/lubuntu/main/filler; rm /media/lubuntu/main/filler; umount /media/lubuntu/main/; rmdir /media/lubuntu/main"
# backup the partition tables, swap and root filesystem partitions as a complete byte sequence
sudo dd if=/dev/${DISK} bs=1M count="${COUNT1MB}" | ${GZIP} --fast -c > /media/lubuntu/DATA/snapshot.iso.gz
sync
