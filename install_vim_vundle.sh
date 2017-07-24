#!/bin/bash

cd ~/
sudo git clone https://github.com/forevercqd/vundle.git ~/vundle
sudo cp -rf  ~/vundle/.vim*  ~/
sudo rm -rf ~/.vim/bundle/Vundle.vim
sudo git clone   https://github.com/gmarik/Vundle.vim.git    ~/.vim/bundle/Vundle.vim
sudo vim
