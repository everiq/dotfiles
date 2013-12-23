Configuration files
===================

Installation
------------

To replicate on a fresh box:

    mkdir ~/Work
    cd ~/Work
    git clone https://github.com/everiq/dotfiles.git
    cd dotfiles
    sh bin/deploy_env.sh

**WARNING**: This will wipe out all existing dot-files and replace them with references to `$ENV/<file>`.

Tips
----

1. bashrc will look for `$HOME/.bash_private` file.
   This file should not be added to github, it is supposed to contain private data (like passwords and so on).
   It is optional though.

