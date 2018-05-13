#!/bin/sh

uname=`uname`
cp ./${uname}/.bash_profile ~/
source ~/.bash_profile

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# For local
# git clone https://github.com/powerline/fonts
# cd fonts && ./install.sh

cp ./.tmux.conf ~/
cp ./.vimrc ~/
cp ./.gitconfig ~/

vim +PluginInstall +qall
