#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	# reset sketchbook location
	#ssh -t laptop@debian-shrimp-"$SUFFIX" "rsync -e 'ssh -i /home/laptop/.ssh/id_rsa' --verbose --whole-file --archive --compress --recursive laptop@debian-shrimp-1:/home/laptop/sketchbook/ /home/laptop/sketchbook/"
	# shutdown running arduino instances
	ssh laptop@debian-shrimp-"$SUFFIX" "killall java"
	# launch a new version of arduino
	ssh laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0.0 nohup ~/Desktop/arduino-1.6.3/arduino > /dev/null &"
	
	#/home/laptop/sketchbook/shrimPov/shrimPov.ino
	#/usr/share/arduino/examples/01.Basics/Blink/Blink.ino
done
