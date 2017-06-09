set ic
set nu
set smartindent
set spell spelllang=en
set nobackup
set noswapfile
set wildmenu
set path+=**
set cursorline
set tabstop=8 shiftwidth=8 softtabstop=0
set noexpandtab
set hlsearch
syntax enable

" Fix mac os delete button..
set backspace=eol,start

call plug#begin('~/.vim/plugged')
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
call plug#end()

set background=dark
colorscheme hybrid_material

" airline setup
set laststatus=2
let g:airline_theme='distinguished'

hi CursorLine cterm=underline

let &colorcolumn=join(range(81,82),",")

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

