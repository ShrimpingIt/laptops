#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t -t learner@debian-shrimp-"$SUFFIX" "cd ~/Desktop/git/cockle && python3 deployall.py" &
done
