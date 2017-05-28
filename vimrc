set ic
set nu
set smartindent
set spell spelllang=pt,en
set nobackup
set noswapfile
set wildmenu
set path+=**
syntax on

call plug#begin('~/.vim/plugged')
Plug 'tyrannicaltoucan/vim-quantum'
call plug#end()

colorscheme quantum

let &colorcolumn=join(range(81,82),",")

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

