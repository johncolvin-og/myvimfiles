#!/usr/bin/env fish

set repo_root $argv[1]
eval $repo_root/configure --with-features=huge \
--enable-multibyte \
--enable-pythoninterp=yes \
--enable-python3interp=yes \
--enable-gui=gnome3 \
--enable-cscope
