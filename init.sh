#!/bin/bash

# exit if a command fails
set -e

# install initial packages
sudo dnf install -y vim ansible git zsh libselinux-python python3-dnf

ansible-playbook -i ./hosts.dist -K ./main.yml

# Install and update vundle
# This should probably be moved to ansible
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install tpm and plugins
# need to automate plugin install
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
