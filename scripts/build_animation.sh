#!/bin/bash
PASSWORD=$1
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh learner@debian-shrimp-"$SUFFIX" "killall mirage"
	ssh -t learner@debian-shrimp-"$SUFFIX" DISPLAY=:0.0 mirage -R -f /home/laptop/Desktop/shrimpingit/pov_build_updated &
done
#arduino-mk
