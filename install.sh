#!/bin/bash

INSTALL_FILES='.vimrc .vim .gitconfig .pythonstartup .git-completion.bash .profile'

function backup_existing_file {
    local filename=$1
    [ -f ~/${filename} ] && mv ~/${filename} ~/${filename}.bkp
}

function install_file {
    local filename=$1
    ln -s $(pwd)/${filename} ~/${filename}
}

for filename in ${INSTALL_FILES}
do
    backup_existing_file $filename
    install_file $filename
    echo "Installed ${filename} at ~/"
done
