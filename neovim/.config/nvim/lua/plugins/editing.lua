-- editing.lua:
-- Plugins that make editing more convenient and efficient.

return {
  -- Adds Readline-style key bindings to normal and command line mode.
  -- This increases consistency with Bash, Zsh, Emacs, and other programs
  -- which support similar key bindings.
  -- https://github.com/tpope/vim-rsi
  "tpope/vim-rsi",

  -- Highlight trailing whitespace and remove it on save.
  -- https://github.com/ntpeters/vim-better-whitespace
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

  -- Auto-close pairs like "(" and ")" while writing.
  -- https://github.com/windwp/nvim-autopairs
  {
    "windwp/nvim-autopairs",
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    opts = {},
    config = function()
      require("nvim-autopairs").setup {
        check_ts = true,
      }

      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local handlers = require('nvim-autopairs.completion.handlers')

      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done({
          filetypes = {
            ["*"] = {
              ["("] = {
                kind = {
                  cmp.lsp.CompletionItemKind.Function,
                  cmp.lsp.CompletionItemKind.Method,
                },
                handler = handlers["*"]
              }
            },
          },
        })
      )
    end
  },

  -- HTML tag auto-closing based on Tree-Sitter.
  -- https://github.com/windwp/nvim-ts-autotag
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      enable_close_on_slash = false,
    },
  },

  -- Distraction-less writing.
  -- https://github.com/folke/zen-mode.nvim
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
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
}
