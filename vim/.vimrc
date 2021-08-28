language en_US.UTF-8

""" Defaults """

""" Basics """

" Disable Vi compatibility mode.
set nocompatible

" Enable file type plugins.
filetype detect

" Load Vim default configuration.
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Enable hidden buffers.
set hidden

" Show line numbers.
set number

" Highlight search results.
set hlsearch

" Ignore case when searching, unless the search term 
" contains at least one capital letter.
set ignorecase
set smartcase

" Use two-space indentation by default.
set tabstop=2 shiftwidth=2 expandtab smarttab

" Put swapfiles into a dedicated folder, rather than using
" the same folder as the actual file.
set directory^=$HOME/.vim/tmp//

" Enable persistent undo.
set undodir=$HOME/.vim/undo
set undofile

" Customize completion in the Ex command line.
set wildmode=longest,list

" Decrease the update time (milliseconds of inactivity before 
" updating the swap file). Also used by some plugins.
set updatetime=500

" Use the space key as <leader>.
let mapleader = " "

""" GUI """

" Font
set guifont=Menlo-Regular:h12

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

" Truecolor
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

""" Plugin Pre-Configuration """

" ALE
let g:ale_completion_enabled = 1

""" Plugins """

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'vue'] }
Plug 'preservim/nerdtree'
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

" Disable Truecolor in Terminal.app (as it doesn't support it).
if $TERM_PROGRAM == 'Apple_Terminal'
  set notermguicolors
end

colorscheme one
set background=dark

""" Mappings """

" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ALE
nnoremap <leader>jd :ALEGoToDefinition<CR>
nnoremap <leader>jr :ALEFindReferences<CR>

" fugitive.vim
nnoremap <leader>g :Git status<CR>

" fzf
map <C-P> :FZF<CR>
map <leader>b :Buffers<CR>

" vim-commentary
nmap <D-/> gcc
vmap <D-/> gc

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
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
