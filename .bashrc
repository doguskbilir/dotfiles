#!/bin/bash
# ~/.bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source aliases from aliases.sh
if [[ -f "${HOME}/dotfiles/aliases.sh" ]]; then
    source "${HOME}/dotfiles/aliases.sh"
fi

# Set up starship prompt
if [[ -x "$(command -v starship)" ]]; then
    export STARSHIP_CONFIG="${HOME}/dotfiles/starship.toml"
    eval "$(starship init bash)"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
  fi
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set the default editor
export EDITOR=vim
export VISUAL=vim

# Make sure that Terminal emulator is using 256 colors
export TERM=xterm-256color

# Set the prompt color
export PS1="\[\e[32m\]\u@\h \[\e[34m\]\w\[\e[0m\]\$ "

# Enable history timestamping
export HISTTIMEFORMAT="%F %T "

# Ignore duplicates and commands starting with a space
HISTCONTROL=ignoreboth
# Set the history size
HISTSIZE=1000
# Set the history file size
HISTFILESIZE=2000
# Append to the history file, don't overwrite it
shopt -s histappend

# Set the default umask
umask 022

# Use vim keybindings in the terminal
set -o vi
