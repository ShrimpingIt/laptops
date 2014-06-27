#!/bin/bash
PASSWORD=$1
NOW=`date +%s`
for SUFFIX in $(seq 0 9)
do
	echo -n "${SUFFIX}: "
	# initialise time servers
	#ssh laptop@debian-shrimp-"$SUFFIX" "ntpq -p"
	ssh laptop@debian-shrimp-"$SUFFIX" "echo ${PASSWORD} | sudo -S date -s @${NOW}"
	ssh laptop@debian-shrimp-"$SUFFIX" "date"
done
