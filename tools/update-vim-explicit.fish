#!/usr/bin/env fish

set repo_root $argv[1]
if not test -d $repo_root/.git
   echo "No git repo in "$repo_root
   exit 1
end

cd $repo_root

if test (git_is_dirty & echo $status) = 0
   echo "Git repo is dirty"
   exit 1
end

git pull --merge

make distclean
set configure_cmd $repo_root/configure
eval $repo_root/configure --with-features=huge \
--enable-multibyte \
--enable-pythoninterp=yes \
--enable-python3interp=yes \
--enable-gui=gnome3 \
--enable-cscope

sudo make install

