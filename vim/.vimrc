""" Defaults """

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

""" Basics """

set number
set hidden
set hlsearch
set nocompatible
set smartcase
set tabstop=2 shiftwidth=2 expandtab smarttab

" Move swapfiles to dedicated folder
set directory^=$HOME/.vim/tmp//

" Enable persistent undo
set undodir=$HOME/.vim/undo
set undofile

""" GUI """

" Disable all scrollbars
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=R

""" Plugins """

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'nightsense/snow'
Plug 'ntpeters/vim-better-whitespace'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'w0rp/ale'

call plug#end()

""" Color Scheme """

set background=dark
color dracula

""" Mappings """

map <C-P> :FZF<CR>

""" Plugin Config """

" ALE
let g:ale_sign_column_always = 1

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

