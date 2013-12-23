#!/bin/sh

################################################################################
# Essentials {{{
#

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lhF'
alias l.='ls -alhF'
alias lt='ls -lrt'

alias less='less -R'

alias rm='rm -v'
alias mv='mv -v'
alias cp='cp -v'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias ack='ack-grep'

alias vim='vim -X'

# }}}

################################################################################
# Nifty shortcuts {{{
#

alias vim_aliases='vim ~/.bash_aliases'
alias vim_functions='vim ~/.bash_functions'

alias install='sudo aptitude install'
alias update='sudo aptitude update'
alias upgrade='sudo aptitude safe-upgrade'

# }}}

################################################################################
# cdXX {{{
#

# Go up
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Go to the previous folder
alias _='cd -'

alias cdenv='cd ~/Work/dotfiles'

alias cduva='cd ~/Work/puzzles/uva'
alias cdspoj='cd ~/Work/puzzles/spoj'

alias cdtrello='cd ~/Work/trello.py'
alias cdtr=cdtrello

alias cdblog='cd ~/Work/blog'
alias cdb=cdblog

alias cdpython='cd ~/Work/python'
alias cdpy=cdpython

alias cddownloads='cd ~/Downloads'

alias cdsand='cd ~/Work/sandbox'

# }}}

################################################################################
# UVA {{{
#

alias uva_gcc='g++ -lm -lcrypt -O2 -pipe'

# }}}

################################################################################
# Programming {{{
#

alias py2='`which python2`'
alias py3='`which python3`'
alias py=py3

alias mk=make

# }}}

################################################################################
# Misc {{{
#

alias wget='wget --trust-server-names'

alias syncdate='\
    sudo service ntp stop; \
    sudo ntpdate -s time.nist.gov; \
    sudo service ntp start
'

# }}}

