# Renato Mefi Fedora workstation setup with Ansible

It's very opinionated to my usage, but do what you want!

## Compatibility

Fedora 35

## Manual steps to do before starting the provisioning

- Enable RPM fusion free and non-free https://rpmfusion.org/
- Update the system
- Install Nvidia drivers (if you have a nvidia card): https://fedoramagazine.org/install-nvidia-gpu/ and https://rpmfusion.org/Howto/NVIDIA (Also check Wayland section)
- Reboot
- Generate a new GitHub access token: https://github.com/settings/tokens

## Usage

### Starting from scratch

```console
$ ./init.sh
```

### Subsequent times for a quicker start

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
  - create `~/Code`
  - clone favorite repositories in place
- **fedora**
  - **system**
    - set `selinux` to `permissive`
    - configure `motd`
    - Update all packages
    - Install dnf packages listed on `roles/fedora/vars/main.yml`
  - **fedy**
    - clones https://github.com/rpmfusion-infra/fedy
    - Install Jetbrains toolbox
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
