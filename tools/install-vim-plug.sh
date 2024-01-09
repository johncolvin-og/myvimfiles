#!/usr/bin/env bash

declare -r url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
declare -r dest="$HOME/.vim/autoload/plug.vim"
curl -fLo "$dest" --create-dirs "$url"

