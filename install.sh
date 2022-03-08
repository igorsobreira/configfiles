#!/bin/bash

INSTALL_FILES='.gitconfig .zprofile'

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
    echo " link ~/${filename}"
done

echo "installing diff-so-fancy"
brew install diff-so-fancy

echo "installing diff-highlight (require sudo)"
sudo easy_install diff-highlight
