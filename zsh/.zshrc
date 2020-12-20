
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

