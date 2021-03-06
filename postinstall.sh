#!/usr/bin/env bash

sudo cp /boot/config.txt /boot/config.txt.bak

echo "" | sudo tee -a /boot/config.txt > dev/null
echo "display_rotate=1" | sudo tee -a /boot/config.txt > /dev/null
echo "avoid_warnings=1" | sudo tee -a /boot/config.txt > /dev/null

sudo apt-get install unclutter

cd ~
touch .xinitrc
cp .xinitrc .initrc.bak

echo "unclutter &" | sudo tee -a ~/.xinitrc > /dev/null


cp ~/.config/lxsession/LXDE-pi/autostart ~/.config/lxsession/LXDE-pi/autostart.bak
echo "@xset s noblank" >> ~/.config/lxsession/LXDE-pi/autostart
echo "@xset s off" >> ~/.config/lxsession/LXDE-pi/autostart
echo "@xset -dpms" >> ~/.config/lxsession/LXDE-pi/autostart

pm2 startup
env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u pi --hp /home/pi
reboot

