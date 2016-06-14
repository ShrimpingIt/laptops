#!/bin/bash
PASSWORD=$1
for SUFFIX in 1
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S apt-get update"
	ssh -t laptop@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S apt-get -y install chromium-browser iceweasel"
done
#arduino-mk
