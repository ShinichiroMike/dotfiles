## PACKAGES

###############################################################################
#i3 STUFF
###############################################################################
echo "************installing i3************"
yaourt -S i3-wm
yaourt -S i3status
yaourt -S i3blocks
yaourt -S i3lock-blur

###############################################################################
# GIT
###############################################################################
echo "************installing git************"
yaourt -S git
yaourt -S git-extras

###############################################################################
# NODE
###############################################################################
echo "************installing node enviroment************"
yaourt -S nvm
nvm install stable

###############################################################################
#OTHER SOFTWARE
###############################################################################
yaourt -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" #oh-my-zsh
yaourt -S tmux
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
yaourt -S gpick
yaourt -S spotify
yaourt -S stow
yaourt -S ranger
yaourt -S dropbox

###############################################################################
# ATOM
##############################################################################
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
