set ignorecase
set number
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
set colorcolumn=80,81,120,121
set nowrap
syntax on

" set folding options
set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=2
let javaScript_fold=1
let sh_fold_enabled=1
let c_fold_enabled=1

filetype plugin on

" Fix mac os delete button..
set backspace=eol,start,indent

call plug#begin('~/.vim/plugged')
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
call plug#end()

set background=dark
colorscheme hybrid_material

" airline setup
set laststatus=2
let g:airline_theme='distinguished'

hi CursorLine cterm=underline
hi ColorColumn ctermbg=DarkGrey

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Map new Escape Key
imap ,. <Esc>

" map commenters
nmap // <leader>c<space>
vmap // <leader>cs

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
