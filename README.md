dotfiles
========

dotfiles

Installation with ansible
-------------------------
    sudo apt-get install git python-pip
    sudo pip install ansible
    git clone https://github.com/mirweb/dotfiles.git .dotfiles
    cd .dotfiles/playbooks
    ansible-playbook -i inventory bootstrap.yml --ask-sudo-pass

Installation
------------

    sudo apt-get install zsh git
    chsh webermir -> /bin/zsh
    git clone https://github.com/mirweb/dotfiles.git .dotfiles
    cd ~/.dotfiles
    git submodule init
    git submodule update
    script/bootstrap
