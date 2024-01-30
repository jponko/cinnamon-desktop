#!/bin/bash
LOG_FILE=install.txt
#{ 
echo "----------------------------------------------"
echo "This will take about 45 minutes to complete."
echo "----------------------------------------------"
# Update and install OS
sudo apt update -y
sudo apt upgrade -y
# Install Cinnamon desktop
sudo apt install cinnamon-desktop-environment -y
# Install some depandant packages and apps
sudo apt install git freeglut3-dev libasound2-dev libncurses-dev \
chromium-browser sqlite3 libsqlite3-dev ntp ntpstat iptables \
libgtk-3-dev deepin-icon-theme build-essential cmake autotools-dev debconf-utils \
libsamplerate0-dev libxft-dev libfltk1.1-dev libsndfile1-dev libportaudio2 \
portaudio19-dev iptables wsjtx wsjtx-data wsjtx-doc fldigi \
libhamlib-* deepin-icon-theme deepin-terminal nemo-python bibata-cursor-theme -y
#
sudo raspi-config nonint do_boot_behaviour B4
sudo cd /home
# pi's preconfigured desktop
sudo tar -zxvf /home/pi/cinnamon-desktop/pi.tgz
# install some background images 
cd
unzip -o cinnamon-desktop/Backgrounds
echo "Done installing!"
IFS=''
echo -e "Press [ESC] to exit..."
echo -e "Press [ENTER] to reboot..."
for (( i=120; i>0; i--)); do

printf "\rRebooting in $i seconds..."
read -s -N 1 -t 1 key

if [ "$key" = $'\e' ]; then
        echo -e "\n [ESC] Pressed"
        exit
elif [ "$key" == $'\x0a' ] ;then
        echo -e "\n [Enter] Pressed"
        break
fi
done
sudo reboot
exit
#} 2>&1 | tee -- "$LOG_FILE"

