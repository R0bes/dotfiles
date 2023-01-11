#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='exa -la'
alias grep='grep --color=auto'
alias ..='cd ..'
alias mv='mv -i'
alias rm='rm -i'

alias config='/usr/bin/git --git-dir=$HOME/.config --work-tree=$HOME'

#Exports
export EDITOR=vim
export VISUAL=vim
export LANG=de_DE.UTF-8
export CLICOLOR=1
export PATH
export HISTCONTROL=ignoreboth


PS1='\[\e[01;31m\]\u@\h\[\e[01;34m\] \w \$\[\e[00m\] '
PS2='\[\033[1m\]>>\[\033[0m\] '
