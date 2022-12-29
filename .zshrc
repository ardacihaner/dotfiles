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

FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

autoload -Uz compinit 
compinit

setopt appendhistory autocd
unsetopt beep extendedglob nomatch notify

bindkey -e
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Aliases 
alias ls='ls -G'
alias la='ls -lah'
alias ll='ls -lh'
alias python='python3'
alias pip='pip3'
alias youtube-dl='yt-dlp'

export PATH="/opt/homebrew/opt/binutils/bin:$PATH"

#export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

export HOMEBREW_NO_ANALYTICS=1
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:/opt/homebrew/bin:$PATH"

alias aws='aws --endpoint-url https://object.ord1.coreweave.com'
source <(kubectl completion zsh)
source ~/.p10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
compinit
