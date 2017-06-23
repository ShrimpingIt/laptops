#!/bin/bash
PASSWORD=$1
NOW=`date +%s`
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	# initialise time servers
	#ssh learner@debian-shrimp-"$SUFFIX" "ntpq -p"
	ssh learner@debian-shrimp-"$SUFFIX" "echo ${PASSWORD} | sudo -S date -s @${NOW}"
	ssh learner@debian-shrimp-"$SUFFIX" "date"
done
