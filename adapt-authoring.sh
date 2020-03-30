#!/bin/sh

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add –
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

sudo apt update

sudo apt install nodejs mongodb-org gnupg -y

sudo npm install -g grunt-cli

sudo systemctl enable mongod
sudo systemctl start mongod

cd ~
git clone https://github.com/adaptlearning/adapt_authoring.git
cd adapt_authoring
npm install --production
node install