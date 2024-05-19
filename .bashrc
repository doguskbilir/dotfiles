#!/bin/bash
# ~/.bashrc

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# For Levante
export PATH="${HOME}/.local/bin:${PATH}"

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
HISTSIZE=2000
# Set the history file size
HISTFILESIZE=4000
# Append to the history file, don't overwrite it
shopt -s histappend

# Set the default umask
umask 022

# Use vim keybindings in the terminal
set -o vi

#################################################
# Levante Specific Configurations
#################################################

export DY="/fastdata/ka1081/DYAMOND"
export DYSUMMER="/fastdata/ka1081/DYAMOND/data/summer_data"
export DYWINTER="/fastdata/ka1081/DYAMOND/data/winter_data"
export ARCHWINTER="/arch/bk1040/dyamond_winter"
export ARCHWINTERPP="/arch/bk1040/dyamond_winter_post_processed"
export ARCHSUMMER="/arch/mh1113/"

# From easy.gems.dkrz.de
maxmem_running() {
    sstat --format=AveCPU,MaxRSS,AveRSS,JobID -j "$1" --allsteps
}
maxmem_terminated() {
    sacct --format=JobID,JobName,MaxRSS,Elapsed -j "$1"
}

# Import modules
module load git python3 ncview cdo slk tmux/3.2a-gcc-11.2.0

# Do not exit with Ctrl - D
set -o ignoreeof

# Quick history search
histg() {
    history | grep "$1"
}

#EOF
