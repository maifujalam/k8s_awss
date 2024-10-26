#!/bin/bash
VERSION="v3.15.4"
printf "Installing Helm $VERSION\n"
if [[ ! -f /vagrant/ShellScripts/helm-$VERSION-linux-amd64.tar.gz ]];then
  echo "Downloading Binary.."
  wget https://get.helm.sh/helm-$VERSION-linux-amd64.tar.gz
fi
tar zxf helm-$VERSION-linux-amd64.tar.gz
cp linux-amd64/helm /usr/local/bin/
rm -frv linux-amd64
