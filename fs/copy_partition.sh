#!/bin/bash
GZIP=gzip
# pigz if you want to use multiple cores (increasing speed of compression/decompression)
#GZIP=pigz
# pipeviewer can be added to the gzip pipe if you want progress
#sudo apt-get install pv
DISK=sda
COUNT512B=`sudo fdisk -u -l /dev/${DISK} | tail -n1 | awk '{print $4;}'`
COUNT1MB="$(( $COUNT512B / 2048 ))"
sudo dd if=/dev/zero of=/dev/sda1
# mount sda2 at this point and write a file full of zeroes then delete it
sudo dd if=/dev/sda bs=1M count="${COUNT1MB}" | ${GZIP} --fast -c > /media/DATA/snapshot.iso.gz
# force the partition table for sda to be reloaded at this point, then run the resize utility to 
# cause the partition to be expanded to fill the disk 
