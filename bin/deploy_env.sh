#!/bin/sh
#
# Deploying environment from git
# All previous files will be substituted with symbolic links
# to the appropriate files in the repository.
#
# NOTE: USE WITH CARE
#

if [ -z "$ENV" ]
then
    ENV=$HOME/Work/dotfiles
fi

echo "# ENV=$ENV"

if [ ! -d $ENV -o ! -r "$ENV/bashrc" ]
then
    echo "Environment directory is incorrect. Doing nothing."
    exit 1
fi

ENV_FILES=`ls $ENV | grep -v README`

for i in $ENV_FILES
do
    SRC="$HOME/.$i"
    DST="$ENV/$i"

    echo "creating link '$SRC' -> '$DST'"
done

read -p "[y/N] " Y
case $Y in
[yY])
    ;;
*)
    echo "Abort"
    exit 1
    ;;
esac

for i in $ENV_FILES
do
    SRC="$HOME/.$i"
    DST="$ENV/$i"

    rm -rf "$SRC" 2>/dev/null
    ln -s "$DST" "$SRC"
done

