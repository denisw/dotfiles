""" Basics """

set number
set hlsearch
set nocompatible
set smartcase
set tabstop=2 shiftwidth=2 expandtab smarttab

""" GUI """

" Disable all scrollbars
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=R

""" Plugins """

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'nightsense/snow'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

call plug#end()

""" Color Scheme """

set background=light
color snow

""" Mappings """

map <C-P> :FZF<CR>

""" Plugin Config """

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

