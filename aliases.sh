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
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lA'
alias lr='ls -R'

# List only directories
alias lsd='ls -l | grep "^d"'

# List files sorted by last modification time
alias lt='ls -lt'
# List files sorted by last access time descending
alias lu='ls -ltu'