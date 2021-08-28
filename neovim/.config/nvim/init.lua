-- init.lua
-- ========
--
-- A NeoVim configuration that provides a basic "IDE-lite" experience
-- with linting and autocompletion.
-- a
-- The following software is assumed to be installed:
--
-- * Node.js (for coc.vim)
-- * Ripgrep (for fzf.vim and Ack.vim)

-----------------------------------------------------------------------
-- Basics
-----------------------------------------------------------------------

-- Use en_US.UTF-8 as locale, regardless of system locale.
vim.cmd 'language en_US.UTF-8'

-- Enable hidden buffers.
vim.opt.hidden = true

-- Ignore case when searching, unless the search term
-- contains at least one capital letter.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse support.
vim.opt.mouse = 'a'

-- Show line numbers.
vim.opt.number = true

-- Use two-space indentation by default.
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Customize completion in the Ex command line.
vim.opt.wildmode = {'longest', 'list'}

-- Decrease the update time (milliseconds of inactivity before
-- updating the swap file). Also used by some plugins.
vim.opt.updatetime = 500

-----------------------------------------------------------------------
-- Plugins
-----------------------------------------------------------------------

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- Color Schemes
Plug('lifepillar/vim-solarized8')
Plug('nightsense/snow')
Plug('rakr/vim-one')

-- FZF
Plug('junegunn/fzf', {['do'] = function() vim.call('fzf#install') end})
-- The following software is assumed to be installed:
--
-- * Node.js (for coc.vim)
-- * Ripgrep (for fzf.vim and Ack.vim)

-----------------------------------------------------------------------
-- Basics
-----------------------------------------------------------------------

-- Use en_US.UTF-8 as locale, regardless of system locale.
vim.cmd 'language en_US.UTF-8'

-- Enable hidden buffers.
vim.opt.hidden = true

-- Ignore case when searching, unless the search term
-- contains at least one capital letter.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse support.
vim.opt.mouse = 'a'

-- Show line numbers.
vim.opt.number = true

-- Use two-space indentation by default.
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Customize completion in the Ex command line.
vim.opt.wildmode = {'longest', 'list'}

-- Decrease the update time (milliseconds of inactivity before
-- updating the swap file). Also used by some plugins.
vim.opt.updatetime = 500

-----------------------------------------------------------------------
-- Plugins
-----------------------------------------------------------------------

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- Color Schemes
Plug('lifepillar/vim-solarized8')
Plug('nightsense/snow')
Plug('rakr/vim-one')

-- Other
Plug('junegunn/fzf', {['do'] = function() vim.call('fzf#install') end})
Plug('junegunn/fzf.vim')
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug('ntpeters/vim-better-whitespace')
Plug('tpope/vim-commentary')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-surround')

vim.call('plug#end')

-----------------------------------------------------------------------
-- Plugin Settings
-----------------------------------------------------------------------

-- coc.nvim
vim.g.coc_global_extensions = {
  'coc-css',
  'coc-eslint',
  'coc-git',
  'coc-html',
  'coc-json',
  'coc-prettier',
  'coc-pyright',
  'coc-rust-analyzer',
  'coc-tsserver',
  'coc-yaml',
}

-- FZF
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --follow'

-- vim-better-whitespace
vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0

-----------------------------------------------------------------------
-- Key Mappings
-----------------------------------------------------------------------

-- Use Space as the leader key.
vim.g.mapleader = ' '

-- Add "map" shorthand for key mappings.
function map(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, {})
end

-- Add "noremap" shorthand for key mappings with noremap = true.
function noremap(mode, lhs, rhs)
  map(mode, lhs, rhs, {noremap = true})
end

-- Mappings: FZF
noremap('', '<C-p>', ':FZF<CR>')
noremap('', '<Leader>b', ':Buffers<CR>')

-- Mappings: NERDTree
map('', '<C-n>', ':NERDTreeToggle<CR>')

-- Mappings: vim-commentary
map('n', '<D>/', 'gcc')
map('v', '<D>/', 'gc')

-----------------------------------------------------------------------
-- Colors
-----------------------------------------------------------------------

if vim.fn.has('termguicolors') then
  -- Do not enable Truecolor in Apple's Terminal.app as it does not
  -- support it. (Curiously, it *does* work when running Tmux inside
  -- of of Terminal.app, but in that case $TERM_PROGRAM is 'tmux',
  -- so the condition below still works for that case.)
  vim.opt.termguicolors = (vim.env.TERM_PROGRAM ~= 'Apple_Terminal')
end

vim.cmd 'colorscheme one'
vim.opt.background = 'dark'

