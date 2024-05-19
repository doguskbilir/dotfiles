#!/bin/bash
# ~/.bash_profile

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source .bashrc
if [[ -f "${HOME}/.bashrc" ]]; then
    source "${HOME}/.bashrc"
fi