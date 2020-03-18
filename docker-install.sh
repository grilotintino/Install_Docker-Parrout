#!/bin/sh
# From https://www.hiroom2.com/2017/09/24/parrotsec-3-8-docker-engine-en/

set -e

# Install dependencies.
sudo apt install -y curl apt-transport-https \
     software-properties-common ca-certificates

# Install docker.
curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -
echo "deb https://apt.dockerproject.org/repo/ debian-stretch testing" | \
  sudo tee /etc/apt/sources.list.d/docker-engine.list
sudo apt-get update -y
sudo apt-get install -y docker-engine

# Run docker.
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group for using docker without sudo command.
sudo gpasswd -a "${USER}" docker

# Reboot
sudo reboot