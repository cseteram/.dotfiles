# Dotfiles
My personal dotfiles

## Requirement
* `git`
* `zsh`
* `curl`

## Installation
```
./install.sh
```

You can try it by running a docker image, as like:

```
docker run -it --rm ubuntu /bin/bash -c 'apt update && apt upgrade -y; \
  apt install -y git zsh curl; \
  git clone https://github.com/cseteram/.dotfiles; \
  .dotfiles/install.sh; \
  zsh'
```
