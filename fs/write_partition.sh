#!/bin/bash
GZIP=gzip
# pigz if you want to use multiple cores (increasing speed of compression/decompression)
#GZIP=pigz
sudo ${GZIP} -d /media/lubuntu/DATA/snapshot.iso.gz | sudo dd of=/dev/sda bs=1M

