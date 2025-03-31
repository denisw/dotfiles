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
      vim.cmd("autocmd TermOpen * DisableWhitespace")
    end,
  },

  -- Automatically insert matching parentheses, braces, etc.
  -- https://github.com/echasnovski/mini.pairs
  {
    "echasnovski/mini.pairs",
    opts = {
      modes = {
        insert = true,
        command = true,
        terminal = false,
      },
    },
  },

  {
    "echasnovski/mini.surround",
    opts = {},
  },

  -- Auto-close HTML / XML / JSX tags
  {
    "windwp/nvim-ts-autotag",
    opts = {},
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
