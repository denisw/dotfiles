return {
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
}
