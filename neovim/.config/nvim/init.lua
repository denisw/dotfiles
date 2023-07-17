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

-- Add key mapping to quickly open and reload this config file.
local function reload_vimrc()
  vim.cmd 'luafile $MYVIMRC'
  vim.cmd 'PackerCompile'
end
vim.keymap.set('n', '<leader>v,', ':e $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>vr', reload_vimrc)

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
-- Helpers
-- ====================================================================

function get_system_appearance()
  if vim.fn.has("mac") then
    local output = vim.fn.system("defaults read -g AppleInterfaceStyle")
    if output == "Dark\n" then
      return "dark"
    else
      return "light"
    end
  else
    return "dark"
  end
end

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

  -- use {
  --   'EdenEast/nightfox.nvim',
    -- config = function()
    --   if get_system_appearance() == 'light' then
    --     vim.cmd.colorscheme('dawnfox')
    --   else
    --     vim.cmd.colorscheme('nightfox')
    --   end
    -- end
  -- }

  -- use {
  --   'rebelot/kanagawa.nvim',
  --   config = function()
  --     require('kanagawa').setup({
  --       dimInactive = true,
  --       colors = {
  --         theme = {
  --           all = {
  --             ui = {
  --               bg_gutter = 'none'
  --             }
  --           }
  --         }
  --       }
  --     })
  --     vim.opt.background = 'dark'
  --     vim.cmd.colorscheme('kanagawa')
  --   end
  -- }

  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require('catppuccin').setup {
        background = {
          light = 'latte',
          dark = 'mocha',
        },
        integrations = {
          cmp = true,
          lsp_trouble = true,
          neogit = true,
          neotree = true,
        },
      }

      if get_system_appearance() == 'light' then
        vim.opt.background = 'light'
      else
        vim.opt.background = 'dark'
      end

      vim.cmd.colorscheme('catppuccin')
    end
  }

  -- use {
  --   'dracula/vim',
  --   as = 'dracula',
  --   config = function()
  --     vim.opt.background = 'dark'
  --     vim.cmd.colorscheme('dracula')
  --   end
  -- }

  -- use {
  --   'folke/tokyonight.nvim',
  --   config = function()
  --     if get_system_appearance() == 'light' then
  --       vim.opt.background = 'light'
  --       vim.cmd.colorscheme('tokyonight-day')
  --     else
  --       vim.opt.background = 'dark'
  --       vim.cmd.colorscheme('tokyonight-night')
  --     end
  --   end
  -- }

  -- use {
  --   'navarasu/onedark.nvim',
  --   config = function()
  --     require('onedark').setup {
  --       style = 'cool',
  --       toggle_style_key = '<leader>vc',
  --       toggle_style_list = {'light', 'cool'},
  --     }
  --     -- require('onedark').load()
  --   end
  -- }

  -- use {
  --   'savq/melange-nvim',
  --   config = function()
  --     vim.opt.background = get_system_appearance()
  --     vim.cmd.colorscheme('melange')
  --   end
  -- }

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
    'dcampos/cmp-snippy',
    requires = {
      'hrsh7th/nvim-cmp',
      'dcampos/nvim-snippy',
    }
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')

      cmp.setup {
        snippet = {
          expand = function(args)
            require('snippy').expand_snippet(args.body)
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
          { name = 'snippy' },
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
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        enable_git_status = false,
        enable_diagnostics = false,
        filesystem = {
          follow_current_file = true,
          hijack_netrw_behavior = 'disabled',
        },
      }
      vim.keymap.set('n', '<leader>tt', ':Neotree reveal<cr>')
      vim.keymap.set('n', '<leader>tc', ':Neotree close filesystem<cr>')
    end
  }

  -- Git

  use {
    'NeogitOrg/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('neogit').setup {}
    end
  }

  -- Navigation

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<esc>'] = 'close',
            },
          },
        },
        pickers = {
          buffers = {
            theme = 'dropdown',
          },
          find_files = {
            theme = 'dropdown',
          },
          git_files = {
            show_untracked = true,
            theme = 'dropdown',
          },
          lsp_definitions = {
            theme = 'dropdown',
          },
        }
      }

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
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
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          -- Actions
          map('n', '<leader>hs', gs.stage_hunk)
          map('n', '<leader>hr', gs.reset_hunk)
          map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)
          map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end)
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line{full=true} end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
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

      function executable_condition(name)
        return function(utils)
          return vim.fn.executable(name) == 1
        end
      end

      null_ls.setup {
        sources = {
          null_ls.builtins.code_actions.eslint.with({
            only_local = 'node_modules/.bin',
          }),
          null_ls.builtins.diagnostics.eslint.with({
            only_local = 'node_modules/.bin',
          }),
          null_ls.builtins.diagnostics.shellcheck.with({
            condition = executable_condition('shellcheck'),
          }),
          null_ls.builtins.diagnostics.ruff.with({
            condition = executable_condition('ruff'),
          }),
          null_ls.builtins.formatting.prettier.with({
            only_local = "node_modules/.bin",
          }),
          null_ls.builtins.formatting.yapf.with({
            condition = executable_condition('yapf'),
          }),
        },
      }
    end
  }

  use {
    'neovim/nvim-lspconfig',
    after = { 'nvim-cmp', 'telescope.nvim' },
    config = function()
      local lspconfig = require('lspconfig')
      local cmp_lsp = require('cmp_nvim_lsp')
      local telescope_builtin = require('telescope.builtin')

      local on_attach = function(client, bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, bufopts)
        vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, bufopts)
        vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>D', telescope_builtin.lsp_type_definitions, bufopts)
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

      lspconfig.prismals.setup {
        capabilities = capabilities,
        on_attach = on_attach_with_format_on_save,
      }

      lspconfig.pyright.setup {
        capabilities = capabilities,
        on_attach = on_attach_with_format_on_save,
      }

      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        on_attach = on_attach_with_format_on_save,
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "module"
              }
            }
          }
        }
      }

      lspconfig.solargraph.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lspconfig.tsserver.setup {
        capabilities = capabilities,
        on_attach = on_attach_with_format_on_save,
      }

      lspconfig.volar.setup {
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
        ensure_installed = { 'lua', 'rust', 'typescript', 'tsx', 'vue' },
        indent = { enable = true },
      }
    end
  }

  -- UI
  --

  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('trouble').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }

      options = {silent = true, noremap = true}
      vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', options)
      vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', options)
      vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', options)
      vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', options)
      vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', options)
      vim.keymap.set('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', options)
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'catppuccin', 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
        }
      }
    end
  }

  -- Misc

  use 'prisma/vim-prisma'
  use 'sheerun/vim-polyglot'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'

  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<C-\><C-\>]],
        direction = 'horizontal',
      }

      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', [[<C-\><C-\>]], ':ToggleTerm<CR>', opts)
        vim.keymap.set('t', [[<C-\>k]], '<Cmd>wincmd k<CR>', opts)
      end

      vim.cmd 'autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()'
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
