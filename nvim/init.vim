set number
set showmatch
set ignorecase
set mouse=v
set hlsearch
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
syntax on
filetype plugin indent on
set nocompatible 

call plug#begin(stdpath('data') . '/plugged')
"color scheme
Plug 'dracula/vim' 
"file manager
Plug 'preservim/nerdtree'
"parenthesis tool
Plug 'tpope/vim-surround' 
"search tool
Plug 'junegunn/fzf' 
"autosuggest
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
"syntax checker
Plug 'dense-analysis/ale' 
call plug#end()

colorscheme dracula

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

