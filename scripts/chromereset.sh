#!/bin/bash

for SUFFIX in `./numbers.sh`
do
	ssh learner@debian-shrimp-"$SUFFIX" "rm -rf ~/.config/chromium" &
done
