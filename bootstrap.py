#!/usr/bin/python

import datetime
import os

links = {"/vim/vimrc.symlink":"/.vimrc",
        "/vim/vim.symlink":"/.vim",
        "/ssh.symlink":"/.ssh",
        "/zsh/zshrc.symlink":"/.zshrc",
        "/git/gitconfig.symlink":"/.gitconfig",
        "/screen/screenrc.symlink":"/.screenrc"}

HOME = os.path.abspath(os.getenv("HOME"))
DOTFILES = HOME + "/.dotfiles"

for dest, src  in links.iteritems():
    homeLink = HOME + src
    dotPathDest = DOTFILES + dest
    if os.path.realpath(homeLink) == os.path.realpath(dotPathDest):
        print "\t[exists] ", homeLink, " => ", dotPathDest
    else:
        if os.path.exists(homeLink):
            dt = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
            backup = HOME + '/' + os.path.basename(homeLink) + '_' + dt
            print "\t[backup] ", homeLink + ' => ' + backup
            os.rename(homeLink, backup)
        print "\t[create] " + homeLink +" => "+ dotPathDest
        os.symlink(dotPathDest,homeLink)
