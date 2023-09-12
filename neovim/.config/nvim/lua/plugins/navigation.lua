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
    "nvim-tree/nvim-tree.lua",
    name = "nvim-tree",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>tt", "<cmd>NvimTreeFocus<cr>" },
      { "<leader>tc", "<cmd>NvimTreeClose<cr>" },
    },
    opts = {
      hijack_netrw = false,
      view = {
        width = 40,
      },
      renderer = {
        root_folder_label = ":t",
      },
      update_focused_file = {
        enable = true,
      },
    }
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "folke/trouble.nvim",
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    config = function()
      require("telescope").setup {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = "close",
              ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
            },
            n = {
              ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
            },
          },
          file_ignore_patterns = { "^.git/" },
        },
        pickers = {
          buffers = {
            theme = "ivy",
          },
          find_files = {
            theme = "ivy",
            hidden = true,
          },
          git_files = {
            show_untracked = true,
            theme = "ivy",
          },
          live_grep = {
            theme = "ivy",
          },
          lsp_definitions = {
            theme = "cursor",
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
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end
  }
}
