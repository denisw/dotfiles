return {
  -- A better file explorer.
  -- https://github.com/stevearc/oil.nvim
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>" },
    },
    opts = {},
  },

  -- Commands for quickly switching between related files.
  -- https://github.com/Everduin94/nvim-quick-switcher
  {
    "Everduin94/nvim-quick-switcher",
    keys = {
      {
        "<leader>ot",
        function()
          -- Toggle between test and non-test files.
          -- TypeScript: *.test.ts, *.test.tsx <-> *.ts, *.tsx
          local function toggle_test(p)
            if p.full_suffix:match('^tsx?$') then
              return p.path .. '/' .. p.prefix .. '.test.ts*'
            elseif p.full_suffix:match('^test.tsx?$') then
              return p.path .. '/' .. p.prefix .. '.ts*'
            else
              return p.path .. '/' .. p.file_name
            end
          end
          require('nvim-quick-switcher').find_by_fn(toggle_test)
        end
      },
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
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    opts = {},
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
              ["<c-g>"] = "close",
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
            mappings = {
              i = {
                ["<c-h>"] = "delete_buffer",
              },
              n = {
                ["<c-h>"] = "delete_buffer",
              },
            },
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
