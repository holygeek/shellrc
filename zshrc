BENCHTIME_DONE=t
zmodload zsh/datetime

nanodiff() {
  start=$1
  end=$2
  s_start=${start%.*}
  n_start=${start#*.}
  s_end=${end%.*}
  n_end=${end#*.}
  n_end=$(($n_end + (s_end - s_start) * 1000000000))
  echo $((n_end - n_start))
}

print_with_thousands_grouping() {
   /usr/bin/printf "%'13d" $1
}

FPATH=$FPATH:~/.shell/completion

# Lines configured by zsh-newuser-install
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory autocd notify
unsetopt beep
bindkey -v
bindkey -M viins '' history-incremental-search-backward
# From readline manpage, with C- replaced with ^
# Commented out entries are either "incompatible" with existing bindkeys
# defined elsewhere or not deemed necessary yet
#bindkey -M viins '^@'  set-mark
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^B'  backward-char
#bindkey -M viins '^D'  delete-char
function exit-or-dash() {
  if [ -n "$BUFFER" ]; then
    BUFFER=${BUFFER}-
    CURSOR=$#BUFFER
  else
    exit
  fi
}
zle -N exit-or-dash
bindkey -M viins '^D'  exit-or-dash
bindkey -M viins '^E'  end-of-line
# bindkey -M viins '^F'  forward-char
# bindkey -M viins '^G'  abort
bindkey -M viins '^G'  accept-line
bindkey -M vicmd '^G'  accept-line
bindkey -M viins '^H'  backward-delete-char
# bindkey -M viins '^I'  complete
#bindkey -M viins '^J'  accept-line
bindkey -M viins '^K'  kill-line
bindkey -M viins '^L'  clear-screen
bindkey -M viins '^M'  accept-line
bindkey -M viins '^N'  next-history
bindkey -M viins '^P'  previous-history
#bindkey -M viins '^Q'  quoted-insert
# bindkey -M viins '^R'  reverse-search-history
bindkey -M viins '^S'  forward-search-history
#bindkey -M viins '^T'  transpose-chars
bindkey -M viins '^U'  unix-line-discard
#bindkey -M viins '^V'  quoted-insert
#bindkey -M viins '^W'  unix-word-rubout
#bindkey -M viins '^Y'  yank
bindkey -M viins '^]'  character-search
bindkey -M viins '^_'  undo

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
#zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' ignore-parents parent pwd .. directory
#zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/nazri/.zshrc'

autoload -Uz compinit
[ -z "$BENCHTIME_DONE" ] && start=$EPOCHREALTIME
compinit
# End of lines added by compinstall
if [ -z "$BENCHTIME_DONE" ]; then
  end=$EPOCHREALTIME
  duration=`nanodiff $start $end`
  echo " $(print_with_thousands_grouping $duration) compinit"
fi

#autoload zmv

source $HOME/.shell/main.sh
[ -z "$BENCHTIME_DONE" ] && start=$EPOCHREALTIME
compinit
if [ -z "$BENCHTIME_DONE" ]; then
  end=$EPOCHREALTIME
  duration=`nanodiff $start $end`
  echo " $(print_with_thousands_grouping $duration) compinit 2nd"
fi
export BENCHTIME_DONE=true
export tagsfile=.git/tags
