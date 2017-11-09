call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'farmergreg/vim-lastplace'
Plug 'joshdick/onedark.vim'
Plug 'vim-utils/vim-man'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'stfl/meson.vim'
Plug 'vim-syntastic/syntastic'
call plug#end()

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <C-n> :NERDTreeToggle<CR>

" Map new Escape Key
imap ,. <Esc>

" map toggle commenters
nmap // <leader>cs
vmap // <leader>cs

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
set path+=$LINUX_GIT_PATH/include
set cursorline
set tabstop=8 shiftwidth=8 softtabstop=0
set noexpandtab
set hlsearch
set colorcolumn=81,82,121,122
set nowrap
set t_Co=256 " enforce 256 color
set laststatus=2 " airline setup
set backspace=eol,start,indent " Fix mac osx delete button..
set encoding=utf-8
set textwidth=80
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

if has('termguicolors')
	set termguicolors
endif

let javaScript_fold=1
let sh_fold_enabled=1
let c_fold_enabled=1

highlight ColorColumn ctermbg=DarkGrey
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Plugins setup
let g:signify_vcs_list = [ 'git', 'hg', 'svn' ]
let g:airline_theme='quantum'
let g:enable_bold_font=1
let g:airline_powerline_fonts=1
let g:quantum_italics=1

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" settings of syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

colorscheme quantum

" autocommands
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd FileType python setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=0
