export PS1='%F{green}%n%f@%F{cyan}%m:%f%~:$ '

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format ''
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' original true
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' complete-options true
zstyle ":completion:*:commands" rehash 1
zstyle ':completion:*:*:*:default' menu yes select search

autoload -Uz compinit 
setopt appendhistory autocd
unsetopt beep extendedglob nomatch notify

bindkey -v
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Aliases 
alias ls='ls --color=auto'
alias la='ls -lah --color=auto'
alias ll='ls -lh --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias python='python3'
alias pip='pip3'
alias vim='nvim'

# kubectl aliases
alias k='kubectl'
alias kg='kubectl get '
alias kex='kubectl exec -i -t'
alias kgd='kubectl get deployments '
alias kgp='kubectl get pods '
alias kaf='kubectl apply -f '
alias kl='kubectl logs -f '
function kexsh() {
  kubectl exec -i -t $1 -- /bin/bash
}
# do zsh completion for kexsh
_kexsh() {
  local -a pods
  pods=($(kubectl get pods -o custom-columns=:.metadata.name --no-headers))
  _describe 'pods' pods
}

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# PATHs
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# Enable better globbing
setopt EXTENDED_GLOB
setopt GLOB_DOTS

# Better directory navigation
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

if [[ -n "$ZSH_COMPDUMP" ]]; then
  compinit -i -d "$ZSH_COMPDUMP"
else
  compinit -i
fi

compdef _kexsh kexsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
