#!/bin/bash
PASSWORD=$1
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t learner@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S apt-get remove -y update-notifier"
	ssh -t learner@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S pkill -f update-notifier"
done