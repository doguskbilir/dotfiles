#!/bin/bash
# ~/.bash_aliases

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Always use color output for `ls`
alias ls='ls --color=auto'

# List all files colorized in long format
alias l='ls -lFh'
alias ll='ls -l'
alias la='ls -lAh'
alias lr='ls -R'

# List only directories
alias lsd='ls -l | grep "^d"'

# List files sorted by last modification time
alias lt='ls -lt'
# List files sorted by last access time descending
alias lu='ls -ltu'

# List files sorted by last modification time (recent at top)
alias lt='ls -ltA'
# List files sorted by last modification time (recent at bottom)
alias ltr='ls -ltAr'

# List files sorted by last access time (recent at top)
alias lu='ls -ltuA'
# List files sorted by last access time (recent at bottom)
alias lur='ls -ltuA'

#######################################
# Levante Specific Aliases
#######################################

alias sqme="squeue -u k202158 --long"
alias chdyamond="cd /fastdata/ka1081/DYAMOND"
alias lame="la | grep k202158"
alias pwdp="pwd -P"
alias vi="vim"
alias slkh="slk_helpers"
alias allocme="salloc --x11 --mem=50GB --partition=interactive --account=k20200 --time=08:00:00"
alias stjob="scontrol show job"
alias tailslk='tail ~/.slk/slk-cli.log'
