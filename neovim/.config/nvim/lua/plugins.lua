-- Initialize lazy.nvim.
-- https://github.com/folke/lazy.nvim#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

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

require("lazy").setup({

  ---------------------------------------------------------------------
  -- Colorschemes
  ---------------------------------------------------------------------

  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedarkpro").setup {
        plugins = {
          neo_tree = true,
        },
        highlights = {
          NeoTreeNormal = { bg = "${cursorline}" },
          NeoTreeCursorLine = { bg = "${selection}" },
          NeoTreeNormalNC = { bg = "${cursorline}" },
          NeoTreeCursorLine = { bg = "${selection}" },
        },
        options = {
          cursorline = true,
        },
      }
      if get_system_appearance() == "light" then
        vim.opt.background = "light"
        vim.cmd.colorscheme('onelight')
      else
        vim.opt.background = "dark"
        vim.cmd.colorscheme('onedark')
      end
    end

  },

  {
    "EdenEast/nightfox.nvim",
    enabled = false,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
    config = function()
      require("catppuccin").setup {
        background = {
          light = "latte",
          dark = "mocha",
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
  },

  ---------------------------------------------------------------------
  -- Completion
  ---------------------------------------------------------------------

  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = { 'hrsh7th/nvim-cmp' }
  },

  {
    'hrsh7th/cmp-buffer',
    dependencies = { 'hrsh7th/nvim-cmp' },
  },

  {
    'hrsh7th/cmp-path',
    dependencies = { 'hrsh7th/nvim-cmp' },
  },

  {
    'hrsh7th/cmp-cmdline',
    dependencies = { 'hrsh7th/nvim-cmp' },
  },

  {
    'dcampos/cmp-snippy',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'dcampos/nvim-snippy',
    },
  },

  {
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
  },
---------------------------------------------------------------------
  -- Editing
  ---------------------------------------------------------------------

  "tpope/vim-commentary",
  "tpope/vim-rsi",

  {
    "ntpeters/vim-better-whitespace",
    config = function()
      vim.g.strip_whitespace_on_save = 1
      vim.g.strip_whitespace_confirm = 0
      vim.g.better_whitespace_filetypes_blacklist = {
        "diff",
        "gitcommit",
        "help",
        "qf",
        "toggleterm",
        "unite",
      }
      -- Don"t highlight trailing whitespace in the terminal.
      vim.cmd "autocmd TermOpen * DisableWhitespace"
    end
  },

  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>bz", "<cmd>ZenMode<cr>" },
    },
    opts = {
      window = {
        backdrop = 1,
        width = 90,
        options = {
          number = false,
          cursorline = true,
        },
      },
    },
  },

  {
    "windwp/nvim-autopairs",
    dependencies = { "hrsh7th/nvim-cmp" },
    lazy = false,
    opts = {},
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },

  ---------------------------------------------------------------------
  -- Git
  ---------------------------------------------------------------------

  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, {expr=true})

          map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, {expr=true})

          -- Actions
          map("n", "<leader>hs", gs.stage_hunk)
          map("n", "<leader>hr", gs.reset_hunk)
          map("v", "<leader>hs", function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)
          map("v", "<leader>hr", function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end)
          map("n", "<leader>hS", gs.stage_buffer)
          map("n", "<leader>hu", gs.undo_stage_hunk)
          map("n", "<leader>hR", gs.reset_buffer)
          map("n", "<leader>hp", gs.preview_hunk)
          map("n", "<leader>hb", function() gs.blame_line{full=true} end)
          map("n", "<leader>tb", gs.toggle_current_line_blame)
          map("n", "<leader>hd", gs.diffthis)
          map("n", "<leader>hD", function() gs.diffthis("~") end)
          map("n", "<leader>td", gs.toggle_deleted)

          -- Text object
          map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end
      }
    end
  },

  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Neogit",
    opts = {},
  },

  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    ft = {
      "fugitive"
    },
  },

  ---------------------------------------------------------------------
  -- LSP
  ---------------------------------------------------------------------

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      local null_ls = require("null-ls")

      function executable_condition(name)
        return function(utils)
          return vim.fn.executable(name) == 1
        end
      end

      null_ls.setup {
        sources = {
          null_ls.builtins.code_actions.eslint.with({
            only_local = "node_modules/.bin",
          }),
          null_ls.builtins.diagnostics.eslint.with({
            only_local = "node_modules/.bin",
          }),
          null_ls.builtins.diagnostics.shellcheck.with({
            condition = executable_condition("shellcheck"),
          }),
          null_ls.builtins.diagnostics.ruff.with({
            condition = executable_condition("ruff"),
          }),
          null_ls.builtins.formatting.prettier.with({
            only_local = "node_modules/.bin",
          }),
          null_ls.builtins.formatting.yapf.with({
            condition = executable_condition("yapf"),
          }),
        },
      }
    end
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim"
    },
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_lsp = require("cmp_nvim_lsp")
      local telescope_builtin = require("telescope.builtin")

      local on_attach = function(client, bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, bufopts)
        vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, bufopts)
        vim.keymap.set("n", "gr", telescope_builtin.lsp_references, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<leader>D", telescope_builtin.lsp_type_definitions, bufopts)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      -- The filetypes where null-ls shoulbd be used for formatting
      -- insead of the main language server"s formatting capabilities.
      local null_ls_format_filetypes = {
        "javascript",
        "typescript",
        "typescriptreact"
      }

      local format = function(bufnr)
        local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
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
          vim.keymap.set("n", "<leader>h", ":ClangdSwitchSourceHeader<cr>", bufopts)
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
  },

  ---------------------------------------------------------------------
  -- Navigation
  ---------------------------------------------------------------------

  "tpope/vim-vinegar",

  {
    "nvim-neo-tree/neo-tree.nvim",
    name = "neo-tree",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>tt", "<cmd>Neotree reveal<cr>" },
      { "<leader>tc", "<cmd>Neotree close filesystem<cr>" },
    },
    opts = {
      enable_git_status = false,
      enable_diagnostics = false,
      filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "disabled",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("telescope").setup {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = "close",
            },
          },
        },
        pickers = {
          buffers = {
            theme = "dropdown",
          },
          find_files = {
            theme = "dropdown",
          },
          git_files = {
            show_untracked = true,
            theme = "dropdown",
          },
          lsp_definitions = {
            theme = "dropdown",
          },
        }
      }
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end
  },

  {
    "tpope/vim-projectionist",
    config = function()
      vim.g.projectionist_heuristics = {
        ["*.js"] = {
          ["*.test.js"] = { alternate = "{}.js" },
          ["*.js"] = { alternate = "{}.test.js" },
        },
        ["*.ts|*.tsx"] = {
          ["*.test.ts"] = { alternate = "{}.ts" },
          ["*.test.tsx"] = { alternate = "{}.tsx" },
          ["*.ts"] = { alternate = "{}.test.ts" },
          ["*.tsx"] = { alternate = "{}.test.tsx" },
        },
      }
      vim.keymap.set("n", "<leader>gt", ":A<cr>", {})
    end
  },

  ---------------------------------------------------------------------
  -- Programming Languages
  ---------------------------------------------------------------------

  "prisma/vim-prisma",
  "sheerun/vim-polyglot",

  ---------------------------------------------------------------------
  -- Terminal
  ---------------------------------------------------------------------

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<C-\><C-\>]],
        direction = "horizontal",
      }

      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set("t", [[<C-\><C-\>]], ":ToggleTerm<CR>", opts)
        vim.keymap.set("t", [[<C-\>k]], "<Cmd>wincmd k<CR>", opts)
      end

      vim.cmd "autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()"
    end,
  },

  ---------------------------------------------------------------------
  -- Tree-Sitter
  ---------------------------------------------------------------------

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "rust", "typescript", "tsx", "vue" },
        indent = { enable = true },
      }
    end
  },

  ---------------------------------------------------------------------
  -- UI
  ---------------------------------------------------------------------

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("trouble").setup {}
      options = {silent = true, noremap = true}
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", options)
      vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", options)
      vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", options)
      vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", options)
      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", options)
      vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", options)
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("lualine").setup {}
    end
  },

  ---------------------------------------------------------------------
  -- Utilities
  ---------------------------------------------------------------------

  "tpope/vim-dispatch",
  "tpope/vim-eunuch",

})
