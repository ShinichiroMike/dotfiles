#! /bin/bash
function successOrFail {
    if [ $? -eq 0 ]; then
        echo $1 'done successfuly!'
    else
        echo $1 'has failed :('
    fi
    sleep 5
}
function title {
    echo "#####################################################################"
    echo "#"
    echo "#"
    echo "#"
    echo "#"
    echo "####### $1 "
    echo "#"
    echo "#"
    echo "#"
    echo "#"
    echo "#"
    echo "######################################################################"
    sleep 5
}
####################################################################
# GIT
####################################################################
title 'creating ssh key for github'
ssh-keygen -t rsa -b 4096 -C "miguelo_0000@hotmail.com"
cd ~/.ssh
chmod +x rsa_id.pub
cat id_rsa.pub
read -n1 -r -p "Press any key to continue..."
cd ~/
title 'Dotfiles'
git clone git@github.com:ShinichiroMike/dotfiles.git
mv dotfiles .dotfiles
successOrFail 'dotfiles installation'
title 'config git'
cd ~/.dotfiles
stow git
successOrFail '.gitconfig installation'
cd ~/
