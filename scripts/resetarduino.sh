#!/bin/bash
for SUFFIX in 0 $(seq 2 9)
do
	echo -n "${SUFFIX}: "
	# reset sketchbook location
	ssh -t laptop@debian-shrimp-"$SUFFIX" "rsync -e 'ssh -i /home/laptop/.ssh/id_rsa' --verbose --whole-file --archive --compress --recursive laptop@debian-shrimp-1:/home/laptop/sketchbook/ /home/laptop/sketchbook/"
	# shutdown running arduino instances
	ssh laptop@debian-shrimp-"$SUFFIX" "killall java"
	# launch a new version of arduino
	ssh laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0.0 nohup arduino /home/laptop/sketchbook/shrimPov/shrimPov.ino  > /dev/null &"
	
	#/usr/share/arduino/examples/01.Basics/Blink/Blink.ino
done
