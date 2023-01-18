#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='exa -lga --icons'
alias tree='exa -lga --icons  --tree --level=2'
alias grep='grep --color=auto'
alias ..='cd ..'
alias mv='mv -i'
alias rm='rm -i'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'


alias pacs='sudo pacman -Sy'


#Exports
export EDITOR=vim
export VISUAL=vim
export LANG=de_DE.UTF-8
export CLICOLOR=1
export PATH
export HISTCONTROL=ignoreboth


#PS1='\[\e[01;31m\]\u@\h\[\e[01;34m\] \w \$\[\e[00m\] '
#PS2='\[\033[1m\]>>\[\033[0m\] '

neofetch

# run starship prompt
eval "$(starship init bash)"

[ -f "/home/robs/.ghcup/env" ] && source "/home/robs/.ghcup/env" # ghcup-env