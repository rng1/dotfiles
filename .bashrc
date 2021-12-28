#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo='sudo '

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'

alias untar='tar -xvzf'

alias c='clear'
alias cl='clear;ls;pwd'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias begone='shutdown -h now'
PS1='[\A]\[$(tput bold)\]\u@\h\[$(tput sgr0)\]:\W \$ '
