""" Defaults """

filetype detect
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

" Use the space key as <leader>
let mapleader = " "

""" GUI """

" Font
set guifont=SourceCodePro-Regular:h15

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

Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'vue'] }
Plug 'qpkorr/vim-bufkill'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

" Themes
Plug 'lifepillar/vim-solarized8'
Plug 'nightsense/snow'
Plug 'rakr/vim-one'

call plug#end()

""" Color Scheme """

" Enable Truecolor in iTerm2
" (Apple's Terminal.app doesn't support it currently).
if $TERM_PROGRAM == 'iTerm.app'
  set termguicolors
end

colorscheme one
set background=light

""" Mappings """

" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ALE
nnoremap <leader>jd :ALEGoToDefinition<CR>
nnoremap <leader>jr :ALEFindReferences<CR>

" fugitive.vim
nnoremap <leader>g :Gstatus<CR>

" fzf
map <C-P> :FZF<CR>
map <C-B> :Buffers<CR>

" Netrw
map <leader>d :e %:h<CR>
map <leader>D :e .<CR>

" NERDTree
map <C-N> :NERDTreeToggle<CR>


""" Plugin Config """

" ALE
let g:ale_sign_column_always = 1

" Better Whitespace
let g:strip_whitespace_on_save = 1
let g:better_whitespace_filetypes_blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help']

" FZF
let $FZF_DEFAULT_COMMAND='rg --files --follow'

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx Prettier

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
