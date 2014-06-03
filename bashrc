#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

################################################################################
# Global
#

# Load global bash profile
if [ -r '/etc/profile' ]; then
    source /etc/profile
fi

################################################################################
# General {{{
#

set -o vi

# Prohibit overriding existing files with bash redirection
# Use 'command |> file' if sure
#set -o noclobber

shopt -s checkwinsize

# don't put duplicate lines in the history and ignore lines starting from space
export HISTCONTROL=ignoreboth
export HISTSIZE=10240
# save history timestamps
export HISTTIMEFORMAT='%F %T '

# Include custom bin to the search path
if [ -d "$HOME/.bin" ]; then
    PATH="$HOME/.bin/:$PATH"
fi

if [ -f /etc/arch-release ]; then
    OS=arch
else
    # Guessing
    OS=ubuntu
fi

CDPATH=.:$HOME/Work
PAGER='vim -'

# }}}

################################################################################
# Colors {{{
#

if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

if [ -r "$HOME/.dircolors" ]; then
    eval `dircolors $HOME/.dircolors`
fi

# Force colorfull output from gtest 
export GTEST_COLOR=yes

# }}}

################################################################################
# Prompt {{{
#

# Colors for prompt {{{
bold=$(  tput bold   )
black=$( tput setaf 0)
red=$(   tput setaf 1)
green=$( tput setaf 2)
yellow=$(tput setaf 3)
blue=$(  tput setaf 4)
purple=$(tput setaf 5)
cyan=$(  tput setaf 6)
white=$( tput setaf 7)
reset=$( tput sgr0   )
# }}}

PS1="\[$green\][\[$yellow\]\A\[$green\] \W]\$\[$reset\] "

# }}}

################################################################################
# Load external definitions {{{
#

function load_file()
{
    local file="$HOME/$1"

    if [ -r "$file" ]; then
        echo "loading $file ..."
        source "$file" >/dev/null 2>&1 || true
    fi
}

function reload_env()
{
    load_file ".bash_aliases"
    load_file ".bash_functions"
    load_file ".bash_private"
}

if [ "$TERM" != "dumb" ]; then
    reload_env
fi

# }}}

################################################################################
# OPAM configuration {{{

load_file ".opam/opam-init/init.sh"

# }}}

