#!/bin/bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Bunch of symlinks
#ln -sfv "$DOTFILES_DIR/hg/.hgrc" ~
ln -sfv "$DOTFILES_DIR/tmux/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
#ln -sfv "$DOTFILES_DIR/X/.Xdefaults" ~

# Git
GITCONFIG="$DOTFILES_DIR/git/.gitconfig"
# check if already added
grep "$GITCONFIG" ~/.gitconfig
if [ $? -ne 0 ]; then
    echo "Adding to gitconfig"
    echo -e "[include]\n    path = $GITCONFIG\n" > ~/.gitconfig.new
    cat ~/.gitconfig >> ~/.gitconfig.new
    mv -f ~/.gitconfig.new ~/.gitconfig
else
    echo "Already added to gitconfig"
fi
