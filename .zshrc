
source /usr/share/zsh/share/antigen.zsh

antigen bundle jeffreytse/zsh-vi-mode
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

autoload -Uz compinit
compinit

export EDITOR='nvim'
export K9S_EDITOR='nvim'
export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export GCM_CREDENTIAL_STORE='gpg'
export ZVM_VI_INSERT_ESCAPE_BINDKEY='jk'
export HYPRSHOT_DIR='~/screenshots'
export TIMG_PIXELATION='kitty'

source "$HOME/.ghpats.zsh"

# export HISTFILE="$HOME/.cargo/bin"
export HISTFILE="$HOME/.zsh_hist"
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE

alias n=nvim
alias k=kubectl
alias ls="exa --color=auto --icons=always --show-symlinks"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

source <(fzf --zsh)

source <(switcher init zsh)
alias s=switch
source <(switch completion zsh)

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
