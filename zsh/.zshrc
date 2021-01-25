
# antibody
source <(antibody init)

# plugins
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle rupa/z
antibody bundle lukechilds/zsh-nvm

# prompt
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

# aliases
alias l="ls -lha --color"
alias ll="ls -lh --color"
alias python="/usr/bin/python3"
alias rd="reana-dev"
alias r="ranger"

# colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#00afff"

# virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source $HOME/.local/bin/virtualenvwrapper.sh

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=90000
SAVEHIST=90000
HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY # immediate append
setopt HIST_IGNORE_ALL_DUPS
