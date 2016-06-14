#!/bin/bash
PASSWORD=$1
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -q -t laptop@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -p '' -S apt-get -q -q update"
	echo -n "UPDATED, "
	ssh -q -t laptop@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -p '' -S apt-get -q -q -y upgrade"
	echo -n "UPGRADED, "
	ssh -q -t laptop@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -p '' -S apt-get -q -q -y install firmware-linux-nonfree firmware-iwlwifi firmware-atheros firmware-ralink firmware-realtek chromium-browser git geany arduino eclipse blueman focuswriter pyroom gimp inkscape gparted guayadeque jokosher audacity meld mirage pdfshuffler quodlibet xmlcopyeditor vlc gdebi curl parted pv pigz build-essential xdotool screen ntp ntpdate scratch qtcreator codeblocks monodevelop idle apt-file firmware-b43-installer python-pip python-serial python-bluetooth"
	echo "INSTALLED - DONE"
done
