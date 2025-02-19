#!/bin/bash

# docker.sh
# Permet l'installation automatique de docker
# Usage: ./docker.sh
# Auteur : 935
# Version : 1.0.0

if [ "$UID" -ne 0 ]; then
	echo "docker.sh: Veuillez lancer le script avec sudo."
	exit -1
fi

apt update
apt install apt-transport-https ca-certificates gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update
apt-cache policy docker-ce
apt install docker-ce
systemctl status docker

echo "================================================================================="
echo "docker.sh: Installation terminé"
echo "================================================================================="

exit 0
