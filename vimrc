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
syntax enable

call plug#begin('~/.vim/plugged')
Plug 'scwood/vim-hybrid'
Plug 'rakr/vim-one'
Plug 'google/vim-colorscheme-primary'
Plug 'tyrannicaltoucan/vim-quantum'
call plug#end()

set background=dark
colorscheme hybrid

hi CursorLine cterm=underline

let &colorcolumn=join(range(81,82),",")

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

