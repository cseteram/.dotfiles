#!/bin/bash
set -euo pipefail

BASEDIR=$(dirname "$0")

# zsh
ln -rsf ${BASEDIR}/.zshrc ~/.zshrc

# p10k
ln -rsf ${BASEDIR}/.p10k.zsh ~/.p10k.zsh

# git
ln -rsf ${BASEDIR}/.gitconfig ~/.gitconfig

# vim
ln -rsf ${BASEDIR}/.vimrc ~/.vimrc
ln -rsf ${BASEDIR}/.ideavimrc ~/.ideavimrc

echo 'Finished!'
