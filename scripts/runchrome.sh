#!/bin/bash
#URL="http://lovedbyparents.com/wp-content/uploads/2012/12/mike-7.jpg"
URL="http://i1.mirror.co.uk/incoming/article232023.ece/alternates/s2197/postman-pat-pic-bbc-image-1-719090620.jpg"
#URL="http://shrimping.it"
#APP=chromium-browser
APP=iceweasel
TOKILL=postman
TOFULLSCREEN=postman
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh laptop@debian-shrimp-"$SUFFIX" "killall iceweasel" & 
# suffers from race condition - sometimes iceweasel, sometimes chromium
#	ssh -t -t laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0.0 xdg-open ${URL} > /dev/null &" & 
#	ssh -t -t laptop@debian-shrimp-"$SUFFIX" "${APP} ${URL} > /dev/null &" &
done

#for SUFFIX in `./numbers.sh`
#do
#	ssh laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0.0 nohup $APP $URL > /dev/null" &
#done

# SEND FULLSCREEN KEYS
#for SUFFIX in `./numbers.sh`
#do
#	ssh laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0.0 xdotool search ${TOFULLSCREEN} windowactivate --sync key F11" &
#done
