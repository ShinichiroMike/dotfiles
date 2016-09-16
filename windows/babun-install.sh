#run this to execute this script /bin/dos2unix.exe babun-install.sh
# Pact installation
echo 'pact install'
pact install cygutils-extra
pact install stow
pact install tmux
####################################################################
# GIT
####################################################################

#generating ssh key and connect to github
echo 'creating ssh key for github'
ssh-keygen -t rsa -b 4096 -C "miguelo_0000@hotmail.com"
cd ~/.ssh
chmod 600 id_rsa.pub
chmod 600 id_rsa
cat id_rsa.pub
read -n1 -r -p "Press any key to continue..."
cd ~/

# Installing Tmuxifier
echo 'tmuxifier'
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
rm .zshrc

# Download the dotfiles
echo 'Dotfiles'
git clone git@github.com:ShinichiroMike/dotfiles.git
mv dotfiles .dotfiles
echo 'config git'
cd ~/.dotfiles
stow git
stow zsh
stow tmux
cd ~/

# Copying tmuxifier layouts
echo tmuxifier layouts
rm -rf .tmuxifier/layouts
mkdir .tmuxifier/layouts
cp -r .dotfiles/layouts .tmuxifier/layouts

# Npm global packages
title "npm install"
/bin/zsh -i -c 'npm install -g yo'
