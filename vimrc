set ic
set nu
set smartindent
set spell spelllang=en
set nobackup
set noswapfile
set wildmenu
set path+=**
set cursorline
set term=screen-256color
set tabstop=8 shiftwidth=8 softtabstop=0
set noexpandtab
set hlsearch
syntax enable

" Fix mac os delete button..
set backspace=eol,start

call plug#begin('~/.vim/plugged')
Plug 'scwood/vim-hybrid'
Plug 'rakr/vim-one'
Plug 'google/vim-colorscheme-primary'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'junegunn/seoul256.vim'
call plug#end()

set background=dark
colorscheme seoul256

hi CursorLine cterm=underline

let &colorcolumn=join(range(81,82),",")

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

