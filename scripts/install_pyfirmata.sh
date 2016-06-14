#!/bin/bash
PASSWORD=$1
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S apt-get -y install python-pip"
	ssh -t laptop@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S sudo pip install pyfirmata"
done
#arduino-mk
