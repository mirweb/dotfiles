# dotfiles

## Installation

    sudo apt-get install zsh git
    git clone https://github.com/mirweb/dotfiles.git .dotfiles
    cd ~/.dotfiles
    git submodule init
    git submodule update
    ./bootstrap.py
    chsh webermir -> /bin/zsh

## Provisioning other host

running from inside .dotfiles

```bash
ansible-playbook -i host, distribut-dotfiles.yml
```
