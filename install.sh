#!/bin/bash

echo ".vimrc"
rm -f ~/.vimrc
ln -s `pwd`/vimrc ~/.vimrc

echo ".vim/ folder"
rm -rf ~/.vim
ln -s `pwd`/vim ~/.vim

echo ".gitconfig"
rm -f ~/.gitconfig
ln -s `pwd`/gitconfig ~/.gitconfig

echo ".profile"
rm -f ~/.profile
ln -s `pwd`/profile ~/.profile
