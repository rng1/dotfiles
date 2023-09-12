#       /\ \                      /\ \                    
#       \ \ \____     __      ____\ \ \___   _ __   ___   
#        \ \  __ \  /'__`\   / ,__\\ \  _ `\/\`'__\/ ___\ 
#         \ \ \L\ \/\ \L\.\_/\__, `\\ \ \ \ \ \ \//\ \__/ 
#          \ \____/\ \__/.\_\/\____/ \ \_\ \_\ \_\\ \____\
#           \/___/  \/__/\/_/\/___/   \/_/\/_/\/_/ \/____/


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#=======================
# ALIASES AND FUNCTIONS
#=======================

# >> Make directory and cd into it <<

mcd() {
        mkdir -p "$1" && cd "$1";
}

# >> Extract files depending on extension <<

extract() {
        if [ -f $1 ]; then
                case $1 in
                        *.tar.gz)       tar xvzf $1     ;;
                        *.tar)          tar xvf $1      ;;
                        *.tgz)          tar xvzf $1     ;;
                        *.rar)          unrar x $1      ;;
                        *.gz)           gunzip $1       ;;
                        *.zip)          unzip $1        ;;
                        *.7z)           7z x $1         ;;
                        *)              echo "'$1' cannot be extracted via >extract<" ;;
                esac
        else
                echo "'$1' is not a valid file"
        fi
}


# >> sudo <<

alias _='sudo '
alias please='sudo $(history -p !!)'
alias fuck='sudo $(history -p !!)'

# >> Package Manager <<

alias apti='sudo apt install '
alias aptu='sudo apt update && sudo apt upgrade'
alias aptr='sudo apt remove '

# >> 'ls' family <<

alias ls='ls --color=auto'
alias la='ls -la'

# >> 'cd' family <<

alias ..='cd ..'
alias ...='cd ../..'

# >> Pretty print PATH variables <<

alias path='echo -e ${PATH//:\\n}'

# >> Clear screen <<

alias c='clear'
alias cl='clear;pwd;ls'

# >> various programs <<
alias v='vim '

# >> Shutdown <<

alias gtfo='sudo shutdown -h now'


#========================================
# CURRENT PROMPT: [hh:mm]user@host:pwd $
#========================================

PS1='[\A]\[$(tput bold)\]\u@\h\[$(tput sgr0)\]:\W \$ '
