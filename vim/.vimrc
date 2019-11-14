""" Defaults """

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

""" Basics """

set number
set hidden
set hlsearch
set nocompatible
set ignorecase
set smartcase
set tabstop=2 shiftwidth=2 expandtab smarttab

" Move swapfiles to dedicated folder
set directory^=$HOME/.vim/tmp//

" Enable persistent undo
set undodir=$HOME/.vim/undo
set undofile

""" GUI """

" Font
set guifont=SourceCodePro-Regular:h13

" Disable all scrollbars
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=R

""" Statusline """

" Left
set statusline=
set statusline+=\ \ %f
set statusline+=\ %m

" Right
set statusline+=%=
set statusline+=%{FugitiveStatusline()}
set statusline+=\ %y
set statusline+=\ %3l:%2c
set statusline+=\ \ %*

""" Plugin Pre-Configuration """

" ALE
let g:ale_completion_enabled = 1

""" Plugins """

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'nightsense/snow'
Plug 'ntpeters/vim-better-whitespace'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'w0rp/ale'
Plug 'rakr/vim-one'

call plug#end()

""" Color Scheme """

" Enable Truecolor in iTerm2
" (Apple's Terminal.app doesn't support it currently).
if $TERM_PROGRAM == 'iTerm.app'
  set termguicolors
end

set background=dark
colorscheme one

""" Mappings """

map <C-P> :FZF<CR>

""" Plugin Config """

" ALE
let g:ale_sign_column_always = 1
nnoremap <leader>jd :ALEGoToDefinition<CR>
nnoremap <leader>jr :ALEFindReferences<CR>

" FZF
let $FZF_DEFAULT_COMMAND='rg --files --follow'
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx Prettier

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
