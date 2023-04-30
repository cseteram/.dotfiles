#!/usr/bin/env zsh

#
# Check Prerequisites
#

## Dependences
packages=("git" "zsh" "curl")
for package in ${packages[@]}; do
    if ! command -v $package > /dev/null 2>&1; then
        echo "$package is not installed"
        exit 1
    fi
done

#
# Auto-installation
#

## zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
    env NO_INPUT=y NO_ANNEXES=y bash -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

## vim-plug
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
