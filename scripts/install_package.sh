#!/bin/bash
PASSWORD=$1
for SUFFIX in $(seq 0 9)
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S apt-get -y install ntpdate"
done
#arduino-mk
