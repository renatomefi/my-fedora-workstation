#!/bin/bash

# exit if a command fails
set -e

# install initial packages
sudo dnf install -y vim ansible git zsh python3-libselinux python3-dnf

# clone dotfiles, if this doesn't work just clone it in ~/Workstation/dotfiles manually
mkdir -p ~/Workstation
read -p "Enter your Github Token (https://github.com/settings/tokens/new): "  TOKEN

test -d ~/Workstation/dotfiles \
    || git clone --recursive "https://${USER}:${TOKEN}@github.com/${USER}/dotfiles.git" ~/Workstation/dotfiles
test -d ~/Workstation/my-fedora-workstation \
    || git clone "https://${USER}:${TOKEN}@github.com/${USER}/my-fedora-workstation.git" ~/Workstation/my-fedora-workstation

cd ~/Workstation/my-fedora-workstation \
    && ansible-playbook -i ./hosts.dist -K ./main.yml

# Let's put the repos remote back to git scp style, https will keep 
# asking for Auth  but now everything should just work!
(cd ~/Workstation/my-fedora-workstation && git remote set-url origin git@github.com:${USER}/my-fedora-workstation.git)
(cd ~/Workstation/dotfiles && git remote set-url origin git@github.com:${USER}/dotfiles.git)
