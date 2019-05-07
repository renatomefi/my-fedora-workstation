Renato Mefi Fedora workstation setup with Ansible
==============

It's very opinionated to my usage, but do what you want!

### Compatibility

Fedora 30

### Before running

Install Nvidia drivers: https://fedoramagazine.org/install-nvidia-gpu/ and https://rpmfusion.org/Howto/NVIDIA (Also check Wayland section)

### Usage

`ansible-playbook -i hosts.template -K main.yml`

### More

This was copied and modified from https://github.com/rothgar/ansible-workstation
