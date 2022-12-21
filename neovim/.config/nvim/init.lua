-- Display line numbers.
vim.opt.number = true

-- Ignore case when searching, unless the search term
-- contains at least one capital letter.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use two-space indentation by default.
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Disable line wrapping and tweak horizontal scrolling.
vim.opt.wrap = false
vim.opt.sidescroll = 1

-- Use the space key as <leader>.
vim.g.mapleader = ' '

-- Always show the sign column.
vim.opt.signcolumn = 'yes:1'

-- Enable True Color (24-bit) on all terminals
-- except Terminal.app (which doesn't support it properly).
if vim.env.TERM_PROGRAM ~= 'Apple_Terminal' then
  vim.opt.termguicolors = true
end

-- Packages
-- ========

-- https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Colorschemes

  use 'rakr/vim-one'

  -- Editing

  use 'junegunn/goyo.vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-rsi'
  use 'tpope/vim-sleuth'

  use {
    'ntpeters/vim-better-whitespace',
    setup = function()
      vim.g.strip_whitespace_on_save = 1
      vim.g.strip_whitespace_confirm = 0
      vim.g.better_whitespace_filetypes_blacklist = {
        'diff', 'gitcommit', 'unite', 'qf', 'help'
      }
    end
  }

  -- File Management

  use 'tpope/vim-vinegar'

  -- Fuzzy Finding & Search

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Git

  use {
    'tpope/vim-fugitive',
    cmd = {
      'G',
      'Git',
      'Gdiffsplit',
      'Gread',
      'Gwrite',
      'Ggrep',
      'GMove',
      'GDelete',
      'GBrowse',
      'GRemove',
      'GRename',
      'Glgrep',
      'Gedit',
    },
    ft = {'fugitive'},
  }

  -- LSP

  use 'neovim/nvim-lspconfig'

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Misc

  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Color Scheme
-- ============

vim.opt.background = 'dark'
vim.cmd.colorscheme 'one'

-- Package configuration
-- =====================

-- lspconfig
-- ---------

lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, bufopts)
end

lspconfig['pyright'].setup {
  on_attach = on_attach,
}

lspconfig['tsserver'].setup {
  on_attach = on_attach,
}

lspconfig['rust_analyzer'].setup {
  on_attach = on_attach,
}

-- null-ls
-- -------

local null_ls = require('null-ls')

null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.diagnostics.eslint,
  },
}

-- Key Mappings
-- ============

-- General
-- -------

vim.keymap.set('n', '<leader>v,', ':e ~/.config/nvim/init.lua<cr>')

-- Telescope
-- ---------

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
