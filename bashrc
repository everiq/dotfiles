#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

################################################################################
# Global
#

# Load global bash profile
[ -r '/etc/profile' ] && source /etc/profile

################################################################################
# General {{{
#

set -o vi

# Prohibit overriding existing files with bash redirection
# Use 'command |> file' if sure
#set -o noclobber

shopt -s checkwinsize

# Append to the history file, do not override it
shopt -s histappend

# don't put duplicate lines in the history and ignore lines starting from space
export HISTCONTROL=ignoreboth
export HISTSIZE=10240
# save history timestamps
export HISTTIMEFORMAT='%F %T '

# Integration with ccache
if [ -d "/usr/lib/ccache" ]; then
    export PATH="/usr/lib/ccache:$PATH"
    export CCACHE_PATH="/usr/bin"
fi

[ -d "$HOME/local/bin" ] && export PATH="$HOME/local/bin:$PATH"
[ -d "$HOME/.bin" ]      && export PATH="$HOME/.bin/:$PATH"

# press Ctrl-D twice to quit shell
export IGNOREEOF=1

if [ -f /etc/arch-release ]; then
    OS=arch
else
    # Guessing
    OS=debian
fi

CDPATH=.:$HOME/Work
PAGER='vim -'
EDITOR='vim'

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
# Load external definitions {{{
#

function load_file()
{
    local file="$1"
    if [ -r "$file" ]; then
        echo "loading $file ..."
        source "$file" >/dev/null 2>&1 || true
    fi
}

function reload_env()
{
    local rcdir="$HOME/.bashrc.d"
    for script in $(find -L $rcdir -type f | sort); do
        load_file $script
    done
}

if [ "$TERM" != "dumb" ]; then
    reload_env
fi

# }}}

################################################################################
# Misc {{{

load_file "$HOME/.opam/opam-init/init.sh"

# Disable Fuzzy Finder (breakes standard bash command line completion)

# }}}
