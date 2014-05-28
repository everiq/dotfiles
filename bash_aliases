#!/bin/sh

################################################################################
# Essentials {{{
#

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

alias ls='ls -hF --color=auto'
alias l='ls -CF'
alias lr='ls -R'        # recursive
alias la='ls -A'
alias ll='ls -lhF'
alias l.='ls -alhF'
alias lt='ls -lrt'      # sort by date
alias lz='ll -rS'       # sort by size

alias less='less -R'

alias rm='rm -v'
alias mv='mv -v'
alias cp='cp -v'
alias ln='ln -i'

alias more='less'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias ack='ack-grep'

alias vim='vim -X'

# }}}

################################################################################
# Make Bash error tolerant {{{
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'
# }}}

################################################################################
# Pacman aliases {{{

if [ "$OS" = "arch" ]; then
    alias pac="sudo /usr/bin/pacman -S"     # default action    - install one or more packages
    alias pacu="/usr/bin/pacman -Syu"       # '[u]pdate'        - upgrade all packages to their newest version
    alias pacr="sudo /usr/bin/pacman -Rns"  # '[r]emove'        - uninstall one or more packages
    alias pacs="/usr/bin/pacman -Ss"        # '[s]earch'        - search for a package using one or more keywords
    alias paci="/usr/bin/pacman -Si"        # '[i]nfo'      - show information about a package
    alias paclo="/usr/bin/pacman -Qdt"      # '[l]ist [o]rphans'    - list all packages which are orphaned
    alias pacc="sudo /usr/bin/pacman -Scc"  # '[c]lean cache'   - delete all not currently installed package files
    alias paclf="/usr/bin/pacman -Ql"       # '[l]ist [f]iles'  - list all files installed by a given package
    alias pacexpl="/usr/bin/pacman -D --asexp"  # 'mark as [expl]icit'  - mark one or more packages as explicitly installed 
    alias pacimpl="/usr/bin/pacman -D --asdep"  # 'mark as [impl]icit'  - mark one or more packages as non explicitly installed

    # '[r]emove [o]rphans' - recursively remove ALL orphaned packages
    alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

    alias update='sudo pacman -Su'
fi

# }}}

################################################################################
# Nifty shortcuts {{{
#

alias vim_aliases='vim ~/.bash_aliases'
alias vim_functions='vim ~/.bash_functions'

# Aptitude
if [ "$OS" = "ubuntu" ]; then
    alias install='sudo aptitude install'
    alias update='sudo aptitude update'
    alias upgrade='sudo aptitude safe-upgrade'
fi

# }}}

################################################################################
# cdXX {{{
#

# Go up
alias ..='cd ..'
alias ...='cd ../..'

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

alias cdtimus='cd ~/Work/timus'

# }}}

################################################################################
# UVA/Timus/SPOJ {{{
#

alias uva_gcc='g++ -lm -lcrypt -O2 -pipe'

alias timus_gcc='g++ -static -fno-strict-aliasing -DONLINE_JUDGE -lm -s -x c++ -Wl,-zstack-size=67108864 -O2 -Wno-unused-result'
alias timus_g11='g++ -static -fno-strict-aliasing -DONLINE_JUDGE -lm -s -x c++ -Wl,-zstack-size=67108864 -std=c++11 -O2 -Wno-unused-result'

alias g11='g++ -std=c++11'

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
# Privileged access {{{
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudoedit'
    alias root='sudo -s'
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
    alias netctl='sudo netctl'

    alias syncdate='sudo bash -c "service ntp stop; ntpdate -s time.nist.gov; service ntp start"'
fi
# }}}

################################################################################
# Misc {{{
#

alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias psg='ps -Af | grep'           # requires an argument

alias wget='wget --trust-server-names'

# }}}

