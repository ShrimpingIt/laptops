#!/bin/bash
PASSWORD=$1
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S apt-get update"
done
