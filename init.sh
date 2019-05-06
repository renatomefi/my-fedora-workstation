#!/bin/bash

# exit if a command fails
set -e

# install initial packages
sudo dnf install -y vim ansible git zsh libselinux-python python3-dnf

# clone dotfiles, if this doesn't work just clone it in ~/Workstation/dotfiles manually
mkdir -p ~/Workstation
read -p "Enter your Github Token (https://github.com/settings/tokens/new): "  TOKEN

test -d ~/Workstation/dotfiles \
    || git clone --recursive "https://${USER}:${TOKEN}@github.com/${USER}/dotfiles.git" ~/Workstation/dotfiles
test -d ~/Workstation/my-fedora-workstation \
    || git clone "https://${USER}:${TOKEN}@github.com/${USER}/my-fedora-workstation.git" ~/Workstation/my-fedora-workstation

# If .ssh doesn't exist yet, copy it from the dotfiles so we have future permissions to clone projects
test -d ~/.ssh || cp -R ~/Workstation/dotfiles/ssh ~/.ssh

cd ~/Workstation/my-fedora-workstation \
    && ansible-playbook -i ./hosts.dist -K ./main.yml
