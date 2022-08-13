#!/bin/bash
set -euo pipefail

#
# Check Prerequisites
#

## Dependences
DEPENDENCES=("git" "zsh" "curl")
for package in ${DEPENDENCES[@]}; do
    if ! (hash $package 2>/dev/null); then
        echo "$package not found"
        exit 1
    fi
done

#
# Auto-installation
#

## zinit
if [[ ! -d ~/.local/share/zinit/zinit.git ]]; then
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

## vim-plug
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

## fzf
if [[ ! -d ~/.fzf ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --completion --no-update-rc
fi

#
# Symlinking
#

BASEDIR=$(dirname "$0")

## zsh
ln -rsf ${BASEDIR}/.zshrc ~/.zshrc

## p10k
ln -rsf ${BASEDIR}/.p10k.zsh ~/.p10k.zsh

## git
ln -rsf ${BASEDIR}/.gitconfig ~/.gitconfig

## vim
ln -rsf ${BASEDIR}/.vimrc ~/.vimrc

## ideavim
ln -rsf ${BASEDIR}/.ideavimrc ~/.ideavimrc

## htop
mkdir -p ~/.config/htop
ln -rsf "${BASEDIR}/htoprc" ~/.config/htop/htoprc

echo 'Installation Complete!'
