ZSH=$HOME/.oh-my-zsh
ZSH_THEME="errado"

# CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git vi-mode make-dir-complete)

source $ZSH/oh-my-zsh.sh

make_dir_complete jk ~/src
make_dir_complete h ~/etc
