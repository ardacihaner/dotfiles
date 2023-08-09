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
compinit

setopt appendhistory autocd
unsetopt beep extendedglob nomatch notify

bindkey -e
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Aliases 
alias ls='ls -G'
alias la='ls -lah'
alias ll='ls -lh'
alias python='python3'
alias pip='pip3'

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
compdef _kexsh kexsh

alias aws='aws --endpoint-url https://object.ord1.coreweave.com'

compinit

