# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# zinit
#
if [[ -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit

    zinit ice depth=1
    zinit light romkatv/powerlevel10k

    zinit light zsh-users/zsh-completions
    zinit light zsh-users/zsh-autosuggestions
    zinit light zdharma-continuum/fast-syntax-highlighting
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 
# zsh configuration
#
zstyle ':completion:*' menu select

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

# term
export TERM="xterm-256color"

#
# Path
#

## ~/.local/bin
if [[ -d ~/.local/bin ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

## ~/.local/lib
if [[ -d ~/.local/lib ]]; then
    export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
fi

## fzf
if [[ -f ~/.fzf.zsh ]]; then
    source ~/.fzf.zsh
fi

## cargo
if [[ -d ~/.cargo ]]; then
    source "$HOME/.cargo/env"
fi

## yarn
if [[ -d ~/.yarn ]]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

## nodenv
if [[ -d ~/.nodenv ]]; then
    export PATH="$HOME/.nodenv/bin:$PATH"
    eval "$(nodenv init -)"
fi

## goenv
if [[ -d ~/.goenv ]]; then
    export GOENV_ROOT="$HOME/.goenv"
    export PATH="$GOENV_ROOT/bin:$PATH"
    eval "$(goenv init -)"
    export PATH="$GOROOT/bin:$PATH"
    export PATH="$PATH:$GOPATH/bin"
fi

## rbenv
if [[ -d ~/.rbenv ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init - zsh)"
fi

## pyenv
if [[ -d ~/.pyenv ]]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

## kubectx and kubens
if [[ -d ~/.kubectx ]]; then
    export PATH="$HOME/.kubectx:$PATH"
fi

## vim
if hash vim 2>/dev/null; then
    export EDITOR=vim
    alias vi='vim'
fi

#
# Completions
#
autoload -U +X bashcompinit && bashcompinit

## terraform
if hash terraform 2>/dev/null; then
    complete -o nospace -C /usr/bin/terraform terraform
fi

#
# Useful Scripts
#

# Docker
if hash dockerd 2>/dev/null; then
    # Start Docker daemon automatically when logging in if not running.
    RUNNING=`ps aux | grep dockerd | grep -v grep`
    if [ -z "$RUNNING" ]; then
        sudo dockerd > /dev/null 2>&1 &
        disown
    fi
fi
