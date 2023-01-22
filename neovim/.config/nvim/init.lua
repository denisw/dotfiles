-- init.lua
-- ========
--
-- My Neovim configuration. It aims to provide a lightweight IDE-like
-- editing experience, mainly by leveraging Neovim's support for the
-- Language Server Protocol (LSP).
--
-- NOTE: This configuration assumes that the terminal is configured with
-- a NERD Font (https://www.nerdfonts.com/) so that icons and the status
-- line are displayed correctly.

-- ====================================================================
-- Core
-- ====================================================================

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

-- In terminal buffers, start in insert mode and disable line numbers.
vim.cmd 'autocmd TermOpen * startinsert'
vim.cmd 'autocmd TermOpen * setlocal nonumber'

-- Add key mappings to quickly copy/paste to/from the clipboard.
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')

-- Add key mapping to quickly open this config file.
vim.keymap.set('n', '<leader>v,', ':e ~/.config/nvim/init.lua<cr>')

-- Configuration and key mappings for the diagnostic frameowrk.
vim.diagnostic.config {
  severity_sort = true,
  virtual_text = {
    severity = vim.diagnostic.severity.ERROR,
    source = 'if_many',
  },
  float = {
    format = function(diagnostic)
      return string.format(
        '%s [%s:%s]',
        diagnostic.message,
        diagnostic.source,
        diagnostic.code
      )
    end,
  },
}
vim.keymap.set('n', '<leader>ee', vim.diagnostic.open_float, bufopts)
vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next, bufopts)
vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_prev, bufopts)
vim.keymap.set('n', '<leader>el', vim.diagnostic.setqflist, bufopts)

-- ====================================================================
-- Plugins
-- ====================================================================

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

  use { 'dracula/vim', as = 'dracula' }
  use 'lifepillar/vim-solarized8'
  use 'olimorris/onedarkpro.nvim'
  use 'rakr/vim-one'

  -- Completion

  use {
    'hrsh7th/cmp-nvim-lsp',
    requires = 'hrsh7th/nvim-cmp'
  }

  use {
    'hrsh7th/cmp-buffer',
    requires = 'hrsh7th/nvim-cmp'
  }

  use {
    'hrsh7th/cmp-path',
    requires = 'hrsh7th/nvim-cmp'
  }

  use {
    'hrsh7th/cmp-cmdline',
    requires = 'hrsh7th/nvim-cmp'
  }

  use {
    'hrsh7th/cmp-vsnip',
    requires = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/vim-vsnip'
    }
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')

      cmp.setup {
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
        })
      }
    end
  }

  -- Editing

  use 'tpope/vim-commentary'
  use 'tpope/vim-rsi'
  use 'tpope/vim-sleuth'

  use {
    'ntpeters/vim-better-whitespace',
    setup = function()
      vim.g.strip_whitespace_on_save = 1
      vim.g.strip_whitespace_confirm = 0

      vim.g.better_whitespace_filetypes_blacklist = {
        'diff',
        'gitcommit',
        'help',
        'qf',
        'toggleterm',
        'unite',
      }

      -- Don't highlight trailing whitespace in the terminal.
      vim.cmd 'autocmd TermOpen * DisableWhitespace'
    end
  }

  use {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup {
        window = {
          backdrop = 1,
          width = 90,
          options = {
            number = false,
            cursorline = true,
          },
        },
      }

      vim.keymap.set('n', '<leader>bz', ':ZenMode<cr>', {})
    end
  }

  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function()
      require('nvim-autopairs').setup {}
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
  }

  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  }

  -- File Management

  use 'tpope/vim-vinegar'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require("nvim-tree").setup {
        hijack_netrw = false,
      }
      vim.keymap.set('n', '<leader>tt', ':NvimTreeFindFileToggle<cr>', {})
      vim.keymap.set('n', '<leader>tf', ':NvimTreeFindFile<cr>', {})
      vim.keymap.set('n', '<leader>tF', ':NvimTreeFocus<cr>', {})
      vim.keymap.set('n', '<leader>tc', ':NvimTreeCollapse<cr>', {})
      vim.keymap.set('n', '<leader>tr', ':NvimTreeRefresh<cr>', {})
    end
  }

  -- Navigation

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        pickers = {
          git_files = {
            show_untracked = true,
          },
        }
      }
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', 'gr', builtin.lsp_references, {})
    end
  }

  use {
    'tpope/vim-projectionist',
    config = function()
      vim.g.projectionist_heuristics = {
        ['*.js'] = {
          ['*.test.js'] = { alternate = '{}.js' },
          ['*.js'] = { alternate = '{}.test.js' },
        },
        ['*.ts|*.tsx'] = {
          ['*.test.ts'] = { alternate = '{}.ts' },
          ['*.test.tsx'] = { alternate = '{}.tsx' },
          ['*.ts'] = { alternate = '{}.test.ts' },
          ['*.tsx'] = { alternate = '{}.test.tsx' },
        },
      }
      vim.keymap.set('n', '<leader>gt', ':A<CR>', {})
    end
  }

  -- Git

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

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

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require('null-ls')

      null_ls.setup {
        sources = {
          null_ls.builtins.code_actions.eslint,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.formatting.prettier,
        },
      }
    end
  }

  use {
    'neovim/nvim-lspconfig',
    after = { 'nvim-cmp' },
    config = function()
      local lspconfig = require('lspconfig')
      local cmp_lsp = require('cmp_nvim_lsp')

      local on_attach = function(client, bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      -- The filetypes where null-ls shoulbd be used for formatting
      -- insead of the main language server's formatting capabilities.
      local null_ls_format_filetypes = {
        'javascript',
        'typescript',
        'typescriptreact'
      }

      local format = function(bufnr)
        local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
        local prefer_null_ls = false

        for _, ft in ipairs(null_ls_format_filetypes) do
          if ft == filetype then
            prefer_null_ls = true
          end
        end

        vim.lsp.buf.format({
          bufnr = bufnr,
          filter = function(client)
            if prefer_null_ls then
              return client.name == "null-ls"
            else
              return true
            end
          end,
        })
      end

      local format_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local on_attach_with_format_on_save = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_clear_autocmds({
          group = format_augroup,
          buffer = bufnr
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
          group = format_augroup,
          buffer = bufnr,
          callback = function()
            format(bufnr)
          end,
        })
      end

      local capabilities = cmp_lsp.default_capabilities()

      lspconfig.clangd.setup {
        capabilities = capabilities,
        on_attach = function()
          on_attach(client, bufnr)
          local bufopts = { noremap=true, silent=true, buffer=bufnr }
          vim.keymap.set('n', '<leader>h', ':ClangdSwitchSourceHeader<cr>', bufopts)
        end
      }

      lspconfig.pyright.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        on_attach = on_attach_with_format_on_save,
      }

      lspconfig.tsserver.setup {
        capabilities = capabilities,
        on_attach = on_attach_with_format_on_save,
      }
    end
  }

  -- Tree-Sitter

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'typescript', 'tsx' },
        indent = { enable = true },
      }
    end
  }

  -- UI

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('lualine').setup {}
    end
  }

  -- Misc

  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'

  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<C-\><C-\>]],
        direction = 'float',
      }

      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', [[<C-\><C-\>]], ':ToggleTerm<CR>', opts)
      end

      vim.cmd 'autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()'
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- ====================================================================
-- Colorscheme
-- ====================================================================

local function try_colorscheme(name, background)
  return pcall(function()
    vim.opt.background = background
    vim.cmd.colorscheme(name)
  end)
end

if not try_colorscheme('dracula', 'dark') then
  try_colorscheme('quiet', 'dark')
end
