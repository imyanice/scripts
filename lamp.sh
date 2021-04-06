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

#Installation of all the package
sudo apt install -y apache2 apache2-utils
sudo systemctl start apache2
sudo apt install mariadb-server mariadb-client
sudo systemctl start mariadb
sudo apt install php7.4 libapache2-mod-php7.4 php7.4-mysql php-common php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline
sudo a2enmod php7.4
sudo a2dismod php7.4
sudo apt install php7.4-fpm
sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php7.4-fpm
sudo systemctl restart apache2


#Configuration
sudo mysql_secure_installation

#End
echo "The Lamp was succesfully installed !"
