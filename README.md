# Renato Mefi Fedora workstation setup with Ansible

It's very opinionated to my usage, but do what you want!

## Compatibility

Fedora 32

## Before running

Update the system

Downgrade to cgroups v1 - In order to have snap and docker running correctly
https://fedoraproject.org/wiki/Common_F31_bugs#Docker_package_no_longer_available_and_will_not_run_by_default_.28due_to_switch_to_cgroups_v2.29

Install Nvidia drivers: https://fedoramagazine.org/install-nvidia-gpu/ and https://rpmfusion.org/Howto/NVIDIA (Also check Wayland section)

## Usage

```console
$ ansible-playbook -i hosts.dist -K main.yml
```

## Included playbooks

All the bold words are also tags, you can run them isolated via:

```console
$ ansible-playbook -i hosts.dist -K main.yml --tags="dotfiles"
```

- **common**
  - dotfiles (Comes from cloned dotfiles repository)
    - Symlinks
    - ssh keys permissions
  - pip and packages
  - sudo without password
  - change shell to zsh
- **work**
  - create `~/Workspace`
  - clone favorite repositories in place
- **fedora**
  - **system**
    - set `selinux` to `permissive`
    - configure `motd`
    - add `rpmfusion` including nonfree
    - Update all packages
    - Install dnf packages listed on `roles/fedora/vars/main.yml`
  - **fedy**
    - clones https://github.com/fedy/fedy
    - Install Jetbrains toolbox
    - Install Postman
    - Disable mouse acceleration
    - Install Microsoft TrueType fonts
  - **third-party** software
    - Install google chrome from their repo
    - Install vscode from their repo
    - Install Slack
    - Install Spotify
    - Install Zoom
    - Install [insync](https://www.insynchq.com/)
    - Install [nordvpn](https://nordvpn.com/) ovpn files
  - **docker**
    - Remove native Docker packages
    - Install Docker CE
    - Create `docker` user/group
    - Add current user to `docker` group
    - Install `docker-compose`
  - **kubernetes**
    - Remove native kubectl packages
    - Install kubectl
    - Install kubectx
    - Install kubens
    - Install Kail
    - Install Helm cli
- **gnome**
  - Remove unwanted extensions
  - Install wanted extensions
  - Install themes
  - Configure themes
  - Configure font
  - Configure plugins
  - Configure gnome in general with gsettings and dconf

## More

This was copied and modified from https://github.com/rothgar/ansible-workstation
