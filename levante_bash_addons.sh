#!/bin/bash
# ~/dotfiles/levante_bash_addons.sh

#################################################
# Levante Specific Configurations
#################################################

export PATH="${HOME}/.local/bin:${PATH}"
export DY="/fastdata/ka1081/DYAMOND"
export DYSUMMER="/fastdata/ka1081/DYAMOND/data/summer_data"
export DYWINTER="/fastdata/ka1081/DYAMOND/data/winter_data"
export ARCHWINTER="/arch/bk1040/dyamond_winter"
export ARCHWINTERPP="/arch/bk1040/dyamond_winter_post_processed"
export ARCHSUMMER="/arch/mh1113/"
export TEMP="/fastdata/ka1081/temp"

# From easy.gems.dkrz.de
maxmem_running() {
    sstat --format=AveCPU,MaxRSS,AveRSS,JobID -j "$1" --allsteps
}
maxmem_terminated() {
    sacct --format=JobID,JobName,MaxRSS,Elapsed -j "$1"
}

# Import modules
module load git \
    python3 \
    ncview \
    cdo \
    slk \
    tmux/3.2a-gcc-11.2.0 \
    vim/9.0.1672-gcc-11.2.0

# Do not exit with Ctrl - D
set -o ignoreeof

# Quick history search
histg() {
    history | grep "$1"
}

#################################################
# Levante Specific Aliases
#################################################

alias sqme="squeue -u k202158 --long"
alias chdyamond="cd /fastdata/ka1081/DYAMOND"
alias lame="la | grep k202158"
alias pwdp="pwd -P"
alias vi="vim"
alias slkh="slk_helpers"
alias allocme="salloc --x11 --mem=50GB --partition=interactive --account=k20200 --time=08:00:00"
alias stjob="scontrol show job"
alias tailslk='tail ~/.slk/slk-cli.log'

#EOF