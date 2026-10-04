HISTFILE="$HOME/.cache/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt inc_append_history
mkdir -p "${HISTFILE:h}"
