return {
  -- File explorer with support for filesystem operations through buffer edits.
  -- https://github.com/stevearc/oil.nvim
  {
    "stevearc/oil.nvim",
    dependencies = {
      { "echasnovski/mini.icons", opts = {} },
    },
    keys = {
      { "-", "<cmd>Oil<cr>" },
    },
    lazy = false,
    config = function()
      -- Show the current working directory in the winbar
      -- https://github.com/stevearc/oil.nvim/blob/master/doc/recipes.md#show-cwd-in-the-winbar
      function _G.get_oil_winbar()
        local dir = require("oil").get_current_dir()
        if dir then
          return vim.fn.fnamemodify(dir, ":~")
        else
          return vim.api.nvim_buf_get_name(0)
        end
      end
      require("oil").setup({
        view_options = {
          show_hidden = true,
        },
        win_options = {
          winbar = "%!v:lua.get_oil_winbar()",
        },
      })
    end,
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
            if p.full_suffix:match("^tsx?$") then
              return p.path .. "/" .. p.prefix .. ".test.ts*"
            elseif p.full_suffix:match("^test.tsx?$") then
              return p.path .. "/" .. p.prefix .. ".ts*"
            elseif p.full_suffix:match("^jsx?$") then
              return p.path .. "/" .. p.prefix .. ".test.js*"
            elseif p.full_suffix:match("^test.jsx?$") then
              return p.path .. "/" .. p.prefix .. ".js*"
            else
              return p.path .. "/" .. p.file_name
            end
          end
          require("nvim-quick-switcher").find_by_fn(toggle_test)
        end,
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    name = "nvim-tree",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "_", "<cmd>NvimTreeFocus<cr>" },
      { "<leader>tt", "<cmd>NvimTreeFocus<cr>" },
      { "<leader>tc", "<cmd>NvimTreeClose<cr>" },
    },
    opts = {
      hijack_netrw = false,
      view = {
        width = 38,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      renderer = {
        root_folder_label = ":t",
        icons = {
          git_placement = "after",
        },
      },
      update_focused_file = {
        enable = true,
      },
    },
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
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "folke/trouble.nvim",
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    config = function()
      -- Display entry text after two tabs as comment.
      -- Used to display file paths as filename followed by greyed-out path.
      -- https://github.com/nvim-telescope/telescope.nvim/issues/2014#issuecomment-1873229658
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "TelescopeResults",
        callback = function(ctx)
          vim.api.nvim_buf_call(ctx.buf, function()
            vim.fn.matchadd("TelescopeParent", "\t\t.*$")
            vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
          end)
        end,
      })

      local function filename_first_path_display(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == "." then
          return tail
        else
          return string.format("%s\t\t%s", tail, parent)
        end
      end

      local open_with_trouble = require("trouble.sources.telescope").open

      require("telescope").setup({
        defaults = {
          path_display = filename_first_path_display,
          file_ignore_patterns = { "^.git/" },
          mappings = {
            i = {
              ["<esc>"] = "close",
              ["<c-g>"] = "close",
              ["<c-t>"] = open_with_trouble,
            },
            n = {
              ["<c-t>"] = open_with_trouble,
            },
          },
        },
        pickers = {
          buffers = {
            theme = "dropdown",
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
            theme = "dropdown",
            previewer = false,
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
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
}
