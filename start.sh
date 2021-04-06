@echo off
#We check if the command is run with "sudo"

if [ "$UID" -ne "0" ]
then
   echo "You must run the script in root !"
   exit 0
fi

#Update of the computer
sudo apt update
sudo apt upgrade

#installation of the most common package

sudo apt install nano screen git vim curl wget

#installation of dev package
# Node and npm
wget -qO- https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs
