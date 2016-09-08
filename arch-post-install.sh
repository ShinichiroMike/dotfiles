#! /bin/bash
function isInstalled {
    package=$1
    if pacman -Qi $package > /dev/null ; then
        echo "The package $package is installed"
        echo "skip installation of $package"
    else
        echo "The package $package is not installed"
        yaourt -S $package
    fi
}
function successOrFail {
    if [ $? -eq 0 ]; then
        echo OK
    else
        echo FAIL
    fi
}
PS3='Please enter your choice: '
options=("Config yaourt" "Install and configure git" "Install i3 package group" "Install node environment" "Zsh/tmux/tmuxifier" "Install vim" "Install atom" "Themes" "Install other" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Config yaourt")
            echo "you chose config yaourt"
            echo "**************************************"
            echo "************configuring yaourt************"
            echo "**************************************"
            touch .yaourtrc
            successOrFail
            echo CONFIRM=1 >> .yaourtrc
            echo BUILD_NOCONFIRM=1 >> .yaourtrc
            echo EDITFILES=0 >> .yaourtrc
            successOrFail
            ;;
        "Install and configure git")
            echo "you chose Install and configure git"
            ####################################################################
            # GIT
            ####################################################################
            echo "**************************************"
            echo "************INSTALLING GIT************"
            echo "**************************************"
            isInstalled git
            echo "**************************************"
            echo "************INSTALLING GIT ESTRAS************"
            echo "**************************************"
            isInstalled git-extras
            echo "************installing stow************"
            isInstalled stow
            echo "************installing open-ssh************"
            isInstalled openssh
            echo "************creating ssh-key************"
            ssh-keygen -t rsa -b 4096 -C "miguelo_0000@hotmail.com"
            cd ~/.ssh
            chmod +x rsa_id.pub
            cat id_rsa.pub
            read -n1 -r -p "Press any key to continue..."
            cd ~/
            echo "************Dowloading dotfiles************"
            git clone git@github.com:ShinichiroMike/dotfiles.git
            mv dotfiles .dotfiles
            echo "************configuring git************"
            cd ~/.dotfiles
            stow git
            cd ~/

            ;;
        "Install i3 package group")
            echo "you chose Install i3 package group"
            ####################################################################
            #i3 STUFF
            ####################################################################
            echo "************installing i3 wm************"
            isInstalled i3-wm
            echo "************installing i3 status************"
            isInstalled i3status
            echo "************installing i3 blocks************"
            isInstalled i3blocks
            echo "************installing i3 lock-blur************"
            isInstalled i3lock-blur
            echo "************creating xinit with i3************"
            cd ~/.dotfiles
            stow xinit
            cd ~/
            echo "************Start manually i3 to configure and then copy the dotfiles************"
            ;;
        "Install node environment")
            echo "you chose node environment"
            ####################################################################
            # NODE
            ####################################################################
            echo "************installing node enviroment************"
            echo "************installing nvm************"
            isInstalled nvm
            echo "************installing node stable************"
	        /bin/zsh -i -c 'nvm install stable'
            ;;
        "Zsh/tmux/tmuxifier")
            echo "you chose Zsh/tmux/tmuxifier"
            ####################################################################
            #SHELL STUFF
            ####################################################################
            echo "************installing zsh************"
            isInstalled zsh
            echo "************installing oh-my-zsh************"
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" #oh-my-zsh
            echo "************installing tmux************"
            isInstalled tmux
            echo "************installing tmuxifier************"
            git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
            echo "************configuring zsh and tmux************"
	        rm .zshrc
            cd ~/.dotfiles
            stow zsh
            stow tmux
            cd ~/
            ;;
        "Install vim")
            echo "you chose Install vim"
            ####################################################################
            #VIM
            ####################################################################
            isInstalled vim
            cd ~/.dotfiles
            stow vim
            cd ~/
            ;;
        "Install atom")
            echo "you chose Install atom"
            ####################################################################
            # ATOM
            ####################################################################
            echo "************installing atom************"
            isInstalled atom-editor-git
            #atom packages
            echo "************installing atom packages************"
            apm install atom-beautify
            apm install atom-ternjs
            apm install auto-detect-indentation
            apm install autocomplete-modules
            apm install git-projects
            apm install language-babel
            apm install linter-eslint
            apm install react
            apm install pigments
            apm install tool-bar
            apm install flex-tool-bar
            apm install git-plus
            apm install emmet
            ;;
        "Themes")
            echo "you chose Themes"
            ####################################################################
            #OTHER SOFTWARE
            ####################################################################
            echo "************installing nitrogen************"
            isInstalled nitrogen
            echo "************installing nitrogen************"
            isInstalled gtk-theme-arc
            ;;
        "Install other")
            echo "you chose Install other"
            ####################################################################
            #OTHER SOFTWARE
            ####################################################################
            echo "************installing gpick************"
            isInstalled gpick
            echo "************installing spotify************"
            isInstalled spotify
            echo "************installing ranger************"
            isInstalled ranger
            echo "************installing dropbox************"
            isInstalled dropbox
            echo "************installing chrome************"
            isInstalled google-chrome-stable
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

################################################################################
#TODOS
################################################################################
# Add tmuxifier session and layouts
# chrome install
# Add atom workspace
# assign apps to workspaces (dotfile open in chrome)
