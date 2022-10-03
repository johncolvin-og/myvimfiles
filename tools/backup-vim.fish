!/usr/bin/env fish

set tools_dir (realpath (dirname (status -f))) 
set repo_dir "$tools_dir/.."

set backup_dir "$argv[1]"
if test (count $argv) -eq 0
    set date_suffix (date +%Y-%m-%H%M)
    set backup_dir "$repo_dir/vim.bak.$date_suffix"
end

if test -e "$backup_dir"
    echo "Backup directory, '$backup_dir', already exists"
    exit 1
end

function copy_if_exists
    if test (count $argv) -lt 2
        echo "Invalid arguments to 'copy_if_exists': $argv"
        exit 1
    end

    if test -e "$argv[1]"
        cp "$argv[1]" "$argv[2]" $argv[3..]
    end
end

mkdir "$backup_dir"

copy_if_exists $HOME/.vimrc "$backup_dir"
copy_if_exists $HOME/.vim "$backup_dir"
