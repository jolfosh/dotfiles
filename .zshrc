
source /usr/share/zsh/share/antigen.zsh

antigen bundle jeffreytse/zsh-vi-mode
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

autoload -Uz compinit
compinit

export EDITOR='nvim'
export K9S_EDITOR='nvim'
export PATH="$PATH:$HOME/.local/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export GCM_CREDENTIAL_STORE='gpg'
export ZVM_VI_INSERT_ESCAPE_BINDKEY='jk'


export HISTFILE="$HOME/.cargo/bin"
export HISTSIZE=10000
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE

alias n=nvim
alias k=kubectl
alias cd=z
alias ls="exa --color=auto --icons=always --show-symlinks"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

source <(fzf --zsh)

source <(switcher init zsh)
alias s=switch
source <(switch completion zsh)

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
