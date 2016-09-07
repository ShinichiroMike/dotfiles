## PACKAGES
PS3='Please enter your choice: '
options=("Config yaourt" "Install and configure git" "Install i3 package group" "Install node environment" "Zsh/tmux/tmuxifier" "Install vim" "Install atom" "Install other" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Config yaourt")
            echo "you chose config yaourt"
            echo "************configuring yaourt************"
            touch .yaourtrc
            echo CONFIRM=1 >> .yaourtrc
            echo BUILD_NOCONFIRM=1 >> .yaourtrc
            echo EDITFILES=0 >> .yaourtrc
            ;;
        "Install and configure git")
            echo "you chose Install and configure git"
            ####################################################################
            # GIT
            ####################################################################
            echo "************installing git************"
            yaourt -S git
            echo "************installing git extras************"
            yaourt -S git-extras
            echo "************installing stow************"
            yaourt -S stow
            echo "************configuring git************"
            cd ~/.dotfiles
            stow git
            cd ~/
            echo "************installing open-ssh************"
            yaourt -S openssh
            echo "************creating ssh-key************"
            ssh-keygen -t rsa -b 4096 -C "miguelo_0000@hotmail.com"
            cd ~/.ssh
            chmod +x rsa_id.pub
            cat id_rsa.pub
            read -n1 -r -p "Press any key to continue..."
            cd ~/
            ;;
        "Install i3 package group")
            echo "you chose Install i3 package group"
            ####################################################################
            #i3 STUFF
            ####################################################################
            echo "************installing i3 wm************"
            yaourt -S i3-wm
            echo "************installing i3 status************"
            yaourt -S i3status
            echo "************installing i3 blocks************"
            yaourt -S i3blocks
            echo "************installing i3 lock-blur************"
            yaourt -S i3lock-blur
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
            yaourt -S nvm
            echo "************installing node stable************"
	    /bin/zsh -i -c 'nvm install stable'
            ;;
        "Zsh/tmux/tmuxifier")
            echo "you chose Zsh/tmux/tmuxifier"
            ####################################################################
            #SHELL STUFF
            ####################################################################
            echo "************installing zsh************"
            yaourt -S zsh
            echo "************installing oh-my-zsh************"
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" #oh-my-zsh
            echo "************installing tmux************"
            yaourt -S tmux
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
            yaourt -S vim
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
            yaourt -S atom-editor
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
        "Install other")
            echo "you chose Install other"
            ####################################################################
            #OTHER SOFTWARE
            ####################################################################
            echo "************installing gpick************"
            yaourt -S gpick
            echo "************installing spotify************"
            yaourt -S spotify
            echo "************installing ranger************"
            yaourt -S ranger
            echo "************installing dropbox************"
            yaourt -S dropbox
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
