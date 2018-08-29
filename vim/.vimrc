""" Basics """

set number
set hlsearch
set nocompatible
set smartcase
set tabstop=2 shiftwidth=2 expandtab smarttab

""" Plugins """

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

call plug#end()

""" Mappings """

map <C-P> :FZF<CR>

""" Plugin Config """

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

