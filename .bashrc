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

alias _xi='sudo xbps-install -S '
alias _xu='sudo xbps-install -Su'
alias _xr='sudo xbps-remove -R '

# >> 'ls' family <<

alias ls='ls --color=auto'
alias lx='ls -lXB'              # Sort by extension
alias lk='ls -lSr'              # Sort by size, largest last
alias lt='ls -ltr'              # Sort by date, most recent last

alias ll='ls -la --color=auto'
alias lr='ll -R'                # Recursive ls
alias tree='tree -Csuh'         # Alternative to recursive ls

# >> 'cd' family <<

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# >> Pretty print PATH variables <<

alias path='echo -e ${PATH//:\\n}'

# >> Clear screen <<

alias c='clear'
alias cl='clear;ls;pwd'

# >> various programs <<

alias nf='neofetch'
alias v='nvim '

# >> Shutdown <<

alias begone='clear;tput setaf 1;figlet THOSE WHO RUN AWAY FROM THEIR FATE SHALL BE PUNISHED WITH UTTERMOST SUFFERING -c -f sblood -w 140;tput setaf 7;sleep 5;clear;sudo shutdown -h now'
alias gtfo='sudo shutdown -h now'


#========================================
# CURRENT PROMPT: [hh:mm]user@host:pwd $
#========================================

PS1='[\A]\[$(tput bold)\]\u@\h\[$(tput sgr0)\]:\W \$ '


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
