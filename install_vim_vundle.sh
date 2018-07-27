#!/bin/bash
# code url:	 https://github.com/forevercqd/vundle.git ~/vundle
ROOT_DIR=`pwd`
sudo brew install -y cscope

cd ~/
# sudo git clone https://github.com/forevercqd/vundle.git ~/vundle
sudo cp -rf  $ROOT_DIR/.vim*  ~/
sudo rm -rf ~/.vim/bundle/Vundle.vim
sudo git clone   https://github.com/gmarik/Vundle.vim.git    ~/.vim/bundle/Vundle.vim
sudo vim
