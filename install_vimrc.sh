#!/bin/bash

# Auto-install script for vim config. Requires vim >= 8.2 and node >= 12.

# Colors
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
END=$(tput sgr0)

VIM=$(/usr/bin/vim --version | grep "Vi IMproved" | cut -d" " -f5)
NODE=$(node -v | cut -d"v" -f2)
VIM_VER_REQ="8.2"
NODE_VER_REQ="12.0.0"
FILE=$HOME/.vimrc

if [ "$(printf '%s\n' "$VIM_VER_REQ" "$VIM" | sort -V | head -n1)" = "$VIM_VER_REQ" ]; then
  if [ "$(printf '%s\n' "$NODE_VER_REQ" "$NODE" | sort -V | head -n1)" = "$NODE_VER_REQ" ]; then
    echo "${GREEN}== Vim $VIM or greater detected...$END"
    echo "== Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null
    echo "== Ok"
    if [ -f "$FILE" ]; then
        echo "${GREEN}== $FILE already exists. Rename to $FILE.old... $END"
        mv $HOME/.vimrc $HOME/.vimrc.old
    fi
    echo "== Copy .vimrc to $HOME"
    cp .vimrc $HOME/.vimrc
    echo "== Ok"
    exit 0
  else
    echo "${RED}== Upgrade Node to version 12 or greater ! $END"
    exit 1
  fi
else
  echo "${RED}== Upgrade Vim to version 8.2 or greater ! $END"
  exit 1
fi
