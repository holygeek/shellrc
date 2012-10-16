FPATH=$FPATH:~/.shell/completion

# Lines configured by zsh-newuser-install
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory autocd notify
unsetopt beep
bindkey -v
bindkey -M viins '' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
#zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/nazri/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload zmv

source $HOME/.shell/main.sh
compinit
