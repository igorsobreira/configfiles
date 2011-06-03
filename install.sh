#!/bin/bash

#echo ".vimrc"
#mv ~/.vimrc ~/.vimrc.backup
#ln -s `pwd`/vimrc ~/.vimrc

place_config_files() {
    echo ".vim/ folder"
    if [ -d ~/.vim-backup ]; then
        rm -rf ~/.vim-backup
    fi;
    if [ -d ~/.vim ]; then
        mv -f ~/.vim ~/.vim-backup
    fi;
    ln -s `pwd`/vim ~/.vim

    echo ".gitconfig"
    if [ -f ~/.gitconfig ]; then
        mv ~/.gitconfig ~/.gitconfig.backup
    fi;
    ln -s `pwd`/gitconfig ~/.gitconfig

    echo ".profile"
    if [ -f ~/.profile ]; then
        mv ~/.profile ~/.profile.backup
    fi;
    ln -s `pwd`/profile ~/.profile

    echo ".pythonstartup"
    if [ -f ~/.pythonstartup ]; then
        mv ~/.pythonstartup ~/.pythonstartup.backup
    fi;
    ln -s `pwd`/pythonstartup ~/.pythonstartup

    echo ".git-completion.bash"
    if [ -f ~/.git-completion.bash ];
    then
        mv ~/.git-completion.bash ~/.git-completion.bash.backup
    fi;
    ln -s `pwd`/git-completion.bash ~/.git-completion.bash
}

install_ropevim() {
    echo "installing ropevim"
    cd ropevim
    sudo python setup.py install
    cd ../
    ln -s `pwd`/ropevim/ropevim.vim `pwd`/vim/plugin/ropevim.vim
    ln -s `pwd`/ropevim/ropevim.txt `pwd`/vim/doc/ropevim.txt
} 

place_config_files
install_ropevim
