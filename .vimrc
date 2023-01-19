call plug#begin()
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
call plug#end()

let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

syntax enable
set nocompatible
set wrap
set number
set relativenumber
set background=dark
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a

