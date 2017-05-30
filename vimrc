set ic
set nu
set smartindent
set spell spelllang=en
set nobackup
set noswapfile
set wildmenu
set path+=**
set cursorline
syntax on

call plug#begin('~/.vim/plugged')
Plug 'tyrannicaltoucan/vim-quantum'
call plug#end()

" set black background
let g:quantum_black=1
set background=dark

" set comments in italic
let g:quantum_italics=1

if has('termguicolors')
	set termguicolors
endif
colorscheme quantum

" CursorLine is set by quantum, so reset it after colorscheme
hi CursorLine cterm=underline

let &colorcolumn=join(range(81,82),",")

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

