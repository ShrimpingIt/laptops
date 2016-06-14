#!/bin/bash
# start 'multiline comment'
: <<'swallow' 
for SUFFIX in $(seq 16 25)
do
	echo -n "${SUFFIX}: "
	ssh laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0 gsettings set org.gnome.eog.fullscreen seconds 4"
	ssh laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0 gsettings set org.gnome.eog.view background-color '#FFFFFF'"
	ssh laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0 gsettings set org.gnome.eog.view trans-color '#FFFFFF'"	
	ssh laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0 killall eog"	
done
swallow

# start 'multiline comment'
#: <<'swallow' 
ssh laptop@debian-shrimp-16 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen cdl.jpg" &
ssh laptop@debian-shrimp-17 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg Y.png" &	
ssh laptop@debian-shrimp-18 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg O.png"	&
ssh laptop@debian-shrimp-19 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg U.png"	&
ssh laptop@debian-shrimp-20 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen cdl.jpg" &
ssh laptop@debian-shrimp-21 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg T.png"	&
ssh laptop@debian-shrimp-22 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg H.png"	&
ssh laptop@debian-shrimp-23 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg letter_A.png"	&
ssh laptop@debian-shrimp-24 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg N.png"	&
ssh laptop@debian-shrimp-25 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg K.png"	&
#swallow
# end 'multiline comment'
