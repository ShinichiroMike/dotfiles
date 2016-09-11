#run this to execute this script /bin/dos2unix.exe babun-install.sh
# Pact installation
echo 'pact install'
pact install chere
pact install cygutils-extra
pact install getent
pact install stow
pact install tmux
####################################################################
# GIT
####################################################################
#echo 'creating ssh key for github'
#ssh-keygen -t rsa -b 4096 -C "miguelo_0000@hotmail.com"
cd ~/.ssh
chmod 600 id_rsa.pub
chmod 600 id_rsa
cat id_rsa.pub
read -n1 -r -p "Press any key to continue..."
cd ~/
echo 'Dotfiles'
git clone git@github.com:ShinichiroMike/dotfiles.git
mv dotfiles .dotfiles
echo 'config git'
cd ~/.dotfiles
stow git
cd ~/
