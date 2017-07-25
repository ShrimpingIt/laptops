#!/bin/bash
PASSWORD=$1
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t learner@debian-shrimp-"$SUFFIX" "pip2 install --upgrade pip"
	ssh -t learner@debian-shrimp-"$SUFFIX" "pip3 install --upgrade pip"
#	ssh -t learner@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S pip3 install --upgrade `pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1`"
done
