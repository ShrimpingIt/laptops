#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	#export SKETCH="/home/laptop/sketchbook/shrimPov/shrimPov.ino"
	# export SKETCH="/usr/share/arduino/examples/01.Basics/Blink/Blink.ino"
	export SKETCH=""
	echo -n "${SUFFIX}: "
	# shutdown running arduino instances
	ssh learner@debian-shrimp-"$SUFFIX" "killall squeakvm;" 
	# launch scratch piano
	ssh learner@debian-shrimp-"$SUFFIX" "DISPLAY=:0.0 nohup xdg-open ~/Desktop/projects/utilities/keyboard/shrimpkey_piano.sb > /dev/null &" & 	
done
