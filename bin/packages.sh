#!/bin/sh

if [ `id -u` -ne 0 ]; then
    echo "Run this script with sudo";
    exit 1
fi

apt-get --yes install aptitude

aptitude update
alias apti='aptitude install -y'
apti tasksel debtags build-essential git mercurial ccache colordiff colorgcc vim-gtk chromium-browser pepperflashplugin-nonfree vlc
apti opam m4

