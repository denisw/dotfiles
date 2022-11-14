language en_US.UTF-8

""" Basics

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

" Don't show messages from ins-completion-menu in command line.
set shortmess+=c

" Disable line wrapping and tweak horizontal scrolling.
set nowrap
set sidescroll=1

" Use the space key as <leader>.
let mapleader = " "

""" GUI

" Font
set guifont=Menlo:h12,UbuntuMono-Regular:h14,Menlo:h13

" Disable all scrollbars
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=R

" Disable GUI cursor blinking
:set guicursor+=a:blinkon0

""" Statusline

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

""" Plugins

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bkad/CamelCaseMotion'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'lambdalisue/fern.vim'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'ton/vim-alternate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

" ALE
let g:ale_completion_enabled = 1
Plug 'dense-analysis/ale'

" Color schemes
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

""" Plugin configuration

" ALE
let g:ale_sign_column_always = 1

" Better Whitespace
let g:strip_whitespace_on_save = 1
let g:better_whitespace_filetypes_blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help']

" FZF
let $FZF_DEFAULT_COMMAND='rg --files --follow'

" NERDTree
let NERDTreeHijackNetrw = 0

" Prettier
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

""" Color Scheme

" Disable Truecolor in Terminal.app (as it doesn't support it)
if $TERM_PROGRAM == 'Apple_Terminal'
  set notermguicolors
end

function! Light()
  set background=light
  colorscheme one
endfunction

function! Dark()
  set background=dark
  colorscheme dracula
endfunction

" Define mappings to quickly switch between light and dark mode
command! Light :call Light()
command! Dark :call Dark()

" Choose the scheme to enable on startup
call Dark()

""" Key Mappings

" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ALE
nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> K :ALEHover<CR>

" CamelCaseMotion
map <silent> <leader>w <Plug>CamelCaseMotion_w
map <silent> <leader>e <Plug>CamelCaseMotion_e
map <silent> <leader>ge <Plug>CamelCaseMotion_ge

" fern.vim
nnoremap <leader>- :Fern . -reveal=%<CR>
nnoremap <leader>fd :Fern . -drawer -reveal=%<CR>

" fugitive.vim
nnoremap <C-x>g :Git<CR>
nnoremap <leader>gs :Git<CR>

" fzf
map <C-P> :FZF<CR>
map <C-x>b :Buffers<CR>
map <leader>b :Buffers<CR>

" vim-alternate
nmap <leader>aa :Alternate<CR>

" vim-commentary
nmap <D-/> gcc
vmap <D-/> gc

" NERDTree
map <C-N> :NERDTreeToggle<CR>
