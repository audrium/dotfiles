
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

set term=xterm-256color

# aliases
alias ll="exa -l --icons --time-style=long-iso --group-directories-first --no-permissions"
alias l="ll -a"
alias python="/usr/bin/python3"
alias k="kubectl"
alias r="ranger"
alias cat="bat --theme=gruvbox-dark"
alias cal="khal calendar"
alias rm="rm -iv"

# git aliases
alias gs="git status"
alias gc="git commit -m"
alias gr="git rebase -i"
alias gl="git log"

# work aliases
alias rd="reana-dev"
alias rc="reana-client"
alias rb="reana-benchmark"
alias rds="reana-dev git-status -c ALL"
alias rd-status="rd git-status -c CLUSTER -c CLIENT -c reana --exclude-components=r-a-vomsproxy,r-a-krb5"
alias kubectl-delete-jobs="kubectl delete jobs `kubectl get jobs -o custom-columns=:.metadata.name`"
alias kubectl-delete-job-batches="kubectl delete jobs --all --cascade=false"

export EDITOR="gvim -v"

# colors
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#00afff"

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

# use ripgrep in fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
