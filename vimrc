call plug#begin('~/.vim/plugged')
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
call plug#end()

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <C-n> :NERDTreeToggle<CR>

" Map new Escape Key
imap ,. <Esc>
" map toggle commenters
nmap // <leader>c<space>
vmap // <leader>c<space>

colorscheme hybrid_material

syntax enable
filetype plugin on
filetype indent on

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
set colorcolumn=81,82,121,122
set nowrap
set background=dark
set t_Co=256 " enforce 256 color
set laststatus=2 " airline setup
set backspace=eol,start,indent " Fix mac osx delete button..
set encoding=utf-8
set noshowmode " don't show mode in default statusbar
"TODO: use vi powerline from powerline when it can show file diffs into
"statusbar
"set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim

" set folding options
set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=2

set invlist " show invisible characters
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

let javaScript_fold=1
let sh_fold_enabled=1
let c_fold_enabled=1

highlight CursorLine cterm=underline
highlight ColorColumn ctermbg=DarkGrey
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Plugins setup
let g:signify_vcs_list = [ 'git', 'hg', 'svn' ]
let g:airline_theme='distinguished'
let g:enable_bold_font=1
let g:airline_powerline_fonts=1

" autocommands
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd FileType python setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=0
