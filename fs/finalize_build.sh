#!/bin/bash
# Update host name
read -p "Specify laptop number:" HOST_NUM; sudo sh -c "echo 'debian-shrimp-${HOST_NUM}' > /etc/hostname"

# Resize last partition to fill all available space (assumes first partition is swap?)
PART_DEV=sda
PART_NUM=2
PART_START=$(sudo parted /dev/${PART_DEV} -ms unit s print | grep "^${PART_NUM}" | awk 'BEGIN {FS="[^0-9]?:"} {print $2;}')

fdisk /dev/${PART_DEV} <<EOF
p
d
$PART_NUM
n
p
$PART_NUM
$PART_START

p
w
EOF

  # now set up an init.d script
cat <<\EOF > /etc/init.d/resize2fs_once &&
#!/bin/sh
### BEGIN INIT INFO
# Provides: resize2fs_once
# Required-Start:
# Required-Stop:
# Default-Start: 2 3 4 5 S
# Default-Stop:
# Short-Description: Resize the root filesystem to fill partition
# Description:
### END INIT INFO

. /lib/lsb/init-functions

case "$1" in
start)
log_daemon_msg "Starting resize2fs_once" &&
resize2fs /dev/root &&
rm /etc/init.d/resize2fs_once &&
update-rc.d resize2fs_once remove &&
log_end_msg $?
;;
*)
echo "Usage: $0 start" >&2
exit 3
;;
esac
EOF

chmod +x /etc/init.d/resize2fs_once &&
update-rc.d resize2fs_once defaults

whiptail --msgbox "Root partition has been resized.\nThe filesystem will be enlarged upon the next reboot" 20 60 2
