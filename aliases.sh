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

# List files sorted by last modification time (recent at top)
alias lt='ls -ltA'
# List files sorted by last modification time (recent at bottom)
alias ltr='ls -ltAr'

# List files sorted by last access time (recent at top)
alias lu='ls -ltuA'
# List files sorted by last access time (recent at bottom)
alias lur='ls -ltuAr'
