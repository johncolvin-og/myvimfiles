#!/usr/bin/env fish

set tools_dir (realpath (dirname (status -f))) 
set repo_dir "$tools_dir/.."

# Backup existing vim files
eval "$tools_dir/backup-vim.fish"
set backup_exit_code $status
if test $backup_exit_code -ne 0
    echo "backup-vim.fish exited with code $backup_exit_code"
    exit 1
end

# Copy vimrc
cp "$repo_dir/src/vimrc" "$HOME/.vimrc"

# Download vim-plug
set vim_plug_url "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
set autoload_dir "$HOME/.vim/autoload"
mkdir -p "$autoload_dir"
wget -O "$autoload_dir/plug.vim" "$vim_plug_url"
vim +'PlugInstall --sync' +qa
