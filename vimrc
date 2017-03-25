set ic
set nu
set smartindent
set spell spelllang=pt,en
set nobackup
set noswapfile
set wildmenu
set path+=**
set nocompatible
filetype off
syntax on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'
Plugin 'NLKNguyen/papercolor-theme'

call vundle#end()

filetype plugin indent on

set background=dark
colorscheme PaperColor

let &colorcolumn=join(range(81,82),",")

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

