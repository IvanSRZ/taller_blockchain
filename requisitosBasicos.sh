#!/bin/bash

#
# Script automatizado
#
tmppwd=$PWD
#Utils
echo "####################################################### "
echo "# INSTALANDO COMPONENTES BÁSICOS # "
echo "####################################################### "

#CURL
echo "        ####################################################### "
echo "        #                   INSTALANDO  CURL                  # "
echo "        ####################################################### "
sudo apt install curl
curl -v

#NODE
echo "        ####################################################### "
echo "        #                   INSTALANDO  NODE                  # "
echo "        ####################################################### "

#  Node.js 8.x LTS Carbon is no longer actively supported!
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt install nodejs -y
echo "NODE version ..."
node --version
echo "NPM version ..."
npm --version

#GO
echo "        ####################################################### "
echo "        #                   INSTALANDO GOLANG                 # "
echo "        ####################################################### "
sudo apt update -y
cd /tmp
sudo curl -O https://dl.google.com/go/go1.12.linux-amd64.tar.gz

sudo tar -xvf go1.12.linux-amd64.tar.gz
sudo mv go /usr/local
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
source ~/.profile
echo "GOLANG version ..."
go version

#GOPATH Directory
cd $HOME
mkdir go
echo 'export GOPATH=$HOME/go' >> ~/.profile
source ~/.profile

echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.profile
source ~/.profile

#DOCKER
echo "        ####################################################### "
echo "        #                   INSTALANDO DOCKER                 # "
echo "        ####################################################### "
sudo apt-get update -y

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y

sudo apt-get install -y docker-ce docker-ce-cli containerd.io -y

sudo docker run hello-world

#Ajustar docker deamon
echo "        ####################################################### "
echo "        #                   AJUSTANDO DOCKER                  # "
echo "        ####################################################### "
cd /home
mkdir $USER/.docker
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
sudo chmod 666 /var/run/docker.sock
test the fix
docker run hello-world


#DOCKER_COMPOSE
echo "        ####################################################### "
echo "        #                   INSTALANDO DOCKER COMPOSE         # "
echo "        ####################################################### "
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose
echo "DOCKER version ..."
docker version
echo "DOCKER COMPOSE version ..."
#docker-compose version

#FABRIC
# Ejecuta el setup inicial de las maquinas , creación de directorios y descarga de imagenes de Hyperledger Fabric
echo "        ####################################################### "
echo "        #                   INSTALANDO HYPERLEDGER FABRIC     # "
echo "        ####################################################### "
cd $tmppwd
FABRICSamplesDir="$HOME/hyperledger/fabric"
mkdir -p $FABRICSamplesDir

sudo chmod -R 777 $FABRICSamplesDir
cd $FABRICSamplesDir
sudo curl -sSL http://bit.ly/2ysbOFE | bash -s 2.2.0

echo 'export PATH=$PATH:$HOME/hyperledger/fabric/fabric-samples/bin' >> ~/.profile
source ~/.profile

# Eclipse, Java y Maven deben instalarse en la maquina donde se hara el desarrollo de las API REST
# Maven
# 
################################## FIN

