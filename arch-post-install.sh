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

function isInstalled {
    package=$1
    if pacman -Qi $package > /dev/null ; then
        echo "The package $package is installed"
        echo "skip installation of $package"
    else
        echo "The package $package is not installed"
        yaourt -S $package
        successOrFail $package
    fi
}

PS3='Please enter your choice: '
options=("Config yaourt" "Install and configure git" "Install i3 package group" "Install node environment" "Zsh/tmux/tmuxifier" "Install vim" "Install atom" "Themes" "Install other" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Config yaourt")
            title 'creating .yaourtrc'
            touch .yaourtrc
            successOrFail 'create yaourtrc'
            echo CONFIRM=1 >> .yaourtrc
            echo BUILD_NOCONFIRM=1 >> .yaourtrc
            echo EDITFILES=0 >> .yaourtrc
            successOrFail 'edit yaourt'
            title 'installing stow'
            isInstalled stow
            clear
            ;;
        "Install and configure git")
            echo "you chose Install and configure git"
            ####################################################################
            # GIT
            ####################################################################
            title 'GIT'
            isInstalled git
            title 'git-extras'
            isInstalled git-extras
            title 'openssh'
            isInstalled openssh
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
            clear
            ;;
        "Install i3 package group")
            echo "you chose Install i3 package group"
            ####################################################################
            #i3 STUFF
            ####################################################################
            title 'i3'
            isInstalled i3-wm
            title 'i3status'
            isInstalled i3status
            title 'dmenu'
            isInstalled dmenu
            title 'i3lock-blur'
            isInstalled i3lock-blur
            title 'creating xinit with i3'
            cd ~/.dotfiles
            stow xinit
            cd ~/
            mkdir .config/i3
            cp .dotfiles/i3/config .config/i3/config
            successOrFail 'copy i3 config '
            clear
            ;;
        "Install node environment")
            echo "you chose node environment"
            ####################################################################
            # NODE
            ####################################################################
            title 'nvm'
            yaourt -S  nvm
            title 'node stable'
            source .zshrc
	        /bin/zsh -i -c 'nvm install stable'
            successOrFail 'node stable install '
            #npm global packages
            title "npm install"
            /bin/zsh -i -c 'nvm use stable'
            /bin/zsh -i -c 'npm install -g yo'

            clear
            ;;
        "Zsh/tmux/tmuxifier")
            echo "you chose Zsh/tmux/tmuxifier"
            ####################################################################
            #SHELL STUFF
            ####################################################################
            title 'zsh'
            isInstalled zsh
            title 'oh-my-zsh'
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" #oh-my-zsh
            title 'tmux'
            isInstalled tmux
            title 'tmuxifier'
            git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
            title 'configuring zsh and tmux'
	        rm .zshrc
            cd ~/.dotfiles
            stow zsh
            successOrFail '.zshrc install '
            stow tmux
            successOrFail '.tmux.conf install '
            cd ~/
            rm -rf .tmuxifier/layouts
            cp -r .dotfiles/layouts .tmuxifier/layouts
            successOrFail 'copy tmuxifier layouts'
            clear
            ;;
        "Install vim")
            echo "you chose Install vim"
            ####################################################################
            #VIM
            ####################################################################
            title 'vim'
            isInstalled vim
            cd ~/.dotfiles
            stow vim
            successOrFail '.vimrc intall '
            cd ~/
            rm -rf .vim
            cp -r .dotfiles/.vim ~/
            successOrFail 'copy .vim files '
           curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
            successOrFail 'install vim plug '
            vim :PlugInstall
            clear
            ;;
        "Install atom")
            echo "you chose Install atom"
            ####################################################################
            # ATOM
            ####################################################################
            title 'atom'
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
            clear
            ;;
        "Themes")
            echo "you chose Themes"
            ####################################################################
            #OTHER SOFTWARE
            ####################################################################
            title 'nitrogen'
            isInstalled nitrogen
            title 'gtk-arc-theme'
            isInstalled gtk-theme-arc
            isInstalled compton
            clear
            ;;
        "Install other")
            echo "you chose Install other"
            ####################################################################
            #OTHER SOFTWARE
            ####################################################################
            title gpick
            isInstalled gpick
            title spotify
            isInstalled spotify
            title 'ranger'
            isInstalled ranger
            title 'dropbox'
            isInstalled dropbox
            title 'chrome'
            isInstalled google-chrome
            clear
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
#ranger config
