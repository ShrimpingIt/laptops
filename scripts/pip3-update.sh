#!/bin/bash
PASSWORD=$1
for SUFFIX in 2 # `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t learner@debian-shrimp-"$SUFFIX" "pip3 install --upgrade pip"
	ssh -t learner@debian-shrimp-"$SUFFIX" "pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 sudo pip3 install --upgrade"	
done
