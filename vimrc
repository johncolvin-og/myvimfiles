syntax on

set autoindent
set background=dark
set backspace=indent,eol,start
set belloff=all
set expandtab
set hlsearch
set number
set omnifunc=syntaxcomplete#Complete
set shiftwidth=3
set splitright
set tabstop=3
set ttimeoutlen=100
set visualbell
" Set character code emitted for visualbell to null
set t_vb=
" searches are case insensitive unless upper case char in search text
" for some reason, need to set ignorecase before smartcase for it to work
set ignorecase
set smartcase

let g:python_highlight_all = 1
let g:termdebug_popup = 0
let g:termdebug_wide = 163

filetype plugin on

if &term =~ '^xterm' || &term =~'^screen'
  " Normal Mode: solid block
  let &t_EI .= "\<Esc>[2 q"
  " Replace Mode: blinking block
  let &t_SR .= "\<Esc>[1 q"
  " Insert Mode: blinking vertical bar
  let &t_SI .= "\<Esc>[5 q"
endif

autocmd Filetype cs setlocal tabstop=3 | setlocal expandtab
autocmd Filetype cpp setlocal tabstop=3 | setlocal expandtab
autocmd Filetype cpp nnoremap <buffer> <C-k> :call CommentCpp()<Cr>
autocmd Filetype h setlocal tabstop=3 | setlocal expandtab
autocmd Filetype py setlocal tabstop=4 | setlocal shiftwidth=4 | setlocal expandtab
autocmd Filetype json setlocal tabstop=2 | setlocal shiftwidth=2 | setlocal expandtab
autocmd BufNewFile,BufRead cgdbrc setlocal syntax=vim
autocmd Filetype sh setlocal tabstop=2 | setlocal shiftwidth=2 | setlocal expandtab
autocmd Filetype xml setlocal tabstop=2 | setlocal shiftwidth=2 | setlocal expandtab
autocmd Filetype protobuf setlocal tabstop=2 | setlocal shiftwidth=2 | setlocal expandtab

" syntax mappings
autocmd BufRead,BufNewFile *.proto set filetype=protobuf
autocmd BufRead,BufNewFile *.conf set filetype=protobuf
autocmd BufRead,BufNewFile *Build.props set filetype=xml
autocmd BufRead,BufNewFile *Build.targets set filetype=xml

" Force cursor to be correct.  Vim only changes the cursor in response to mode
" changes; the initial cursor is otherwise simply the active cursor in the
" terminal when vim was launched)
autocmd VimEnter * :normal :startinsert : stopinsert

" key mappings
vmap <c-o> :only
" Enter inserts new line in normal mode
nnoremap <Enter> o<Esc>
" select word with <c-space>
if !has("gui_running")
   " Konsole interprets <c-space> as <c-@> for some reason
   nnoremap <c-@> viw
else
   nnoremap <c-space> viw
endif

" fix common typos (sweet)
:iabbrev adn and
:iabbrev frmo from
:iabbrev howevr however
:iabbrev hwo how
:iabbrev knwo know
:iabbrev siad said
:iabbrev tehn then
:iabbrev waht what
:iabbrev wihch which
:iabbrev woudl would

" Plugins
call plug#begin()
Plug 'tpope/vim-sensible'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
nnoremap <leader><c-e> :NERDTreeToggle<cr>
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
Plug 'vim-scripts/dbext.vim'
Plug 'itchyny/lightline.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'gisodal/vimgdb'
Plug 'mitchpaulus/autocorrect.vim'
" Conque-GDB doesn't work with python>3.3
" Plug 'vim-scripts/Conque-GDB'
call plug#end()
