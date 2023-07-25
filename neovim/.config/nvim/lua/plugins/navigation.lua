return {
  "tpope/vim-vinegar",

  {
    "Everduin94/nvim-quick-switcher",
    keys = {
      -- *.ts <-> *.test.ts
      { "<leader>ot", "<cmd>:lua require('nvim-quick-switcher').toggle('ts', 'test.ts')<cr>" }
    },
  },

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
}
