#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "$SUFFIX prev : "
	ssh learner@debian-shrimp-"$SUFFIX" "grep sketchbook.path ~/.arduino15/preferences.txt"
	ssh learner@debian-shrimp-"$SUFFIX" "perl -pi -e 's/sketchbook.path=\/home\/laptop\/Arduino/sketchbook.path=\/home\/laptop\/Desktop\/projects\/sketchbook/' ~/.arduino15/preferences.txt"
	echo -n "$SUFFIX now : "
	ssh learner@debian-shrimp-"$SUFFIX" "grep sketchbook.path ~/.arduino15/preferences.txt"
done
