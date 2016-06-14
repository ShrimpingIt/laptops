#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "export DISPLAY=:0.0;gsettings set org.gnome.settings-daemon.plugins.power sleep-display-ac 0; gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0; gsettings set org.gnome.desktop.session idle-delay 0"
done
