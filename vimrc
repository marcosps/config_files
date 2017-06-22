call plug#begin('~/.vim/plugged')
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
call plug#end()

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Map new Escape Key
imap ,. <Esc>
" map commenters
nmap // <leader>c<space>
vmap // <leader>cs

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
set background=dark
set t_Co=256 " enforce 256 color
set laststatus=2 " airline setup
set backspace=eol,start,indent " Fix mac osx delete button..

" set folding options
set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=2

let javaScript_fold=1
let sh_fold_enabled=1
let c_fold_enabled=1

let g:airline_theme='distinguished'
let g:enable_bold_font=1

highlight CursorLine cterm=underline
highlight ColorColumn ctermbg=DarkGrey
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

syntax enable
filetype plugin on

colorscheme hybrid_material
