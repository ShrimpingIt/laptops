This approach relies on the following...

A Unetbootin LiveCD of (L)ubuntu on the first partition of a USB (incidentally a Fat32 filesystem). Copying an actual liveCD only produces an ISO disk layout, which can't contain the DATA partition needed.

A DATA partition on the second partition of the same USB (which automatically mounts on booting the LiveCD, making these scripts and the gzipped snapshot available)

A laptop which has had GRUB configured to point to /dev/ identifiers instead of UUIDs and had /etc/fstab do the same. This can be achieved by Chrooting if surgery is needed on the hard-disk layout.

Initially the laptop's two partitions should be a 4GiB swap partition followed by an Ext4 partition just large enough to store the current installation of Ubuntu. This will be written compressed to the snapshot.iso.gz file mounted under /media/lubuntu/DATA

Later this gzipped snapshot can be used to write back over the hard-drive of a suitable machine.
