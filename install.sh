#!/bin/bash
set -euo pipefail

BASEDIR=$(dirname "$0")

# zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# fzf
if [[ ! -d ~/.fzf ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --completion --no-update-rc
fi

# zsh
ln -rsf ${BASEDIR}/.zshrc ~/.zshrc

# p10k
ln -rsf ${BASEDIR}/.p10k.zsh ~/.p10k.zsh

# git
ln -rsf ${BASEDIR}/.gitconfig ~/.gitconfig

# vim
ln -rsf ${BASEDIR}/.vimrc ~/.vimrc

# ideavim
ln -rsf ${BASEDIR}/.ideavimrc ~/.ideavimrc

echo 'Installation Complete!'
