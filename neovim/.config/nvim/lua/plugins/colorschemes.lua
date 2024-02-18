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

function get_colorscheme()
  return "dracula"
end

return {
  {
    "miikanissi/modus-themes.nvim",
    cond = string.find(get_colorscheme(), "modus_") ~= nil,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(get_colorscheme())
    end
  },

  {
    "folke/tokyonight.nvim",
    cond = string.find(get_colorscheme(), "tokyonight") ~= nil,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme(get_colorscheme())
    end
  },

  {
    "Mofiqul/dracula.nvim",
    cond = get_colorscheme() == "dracula",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme("dracula")
    end
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    cond = string.find(get_colorscheme(), "rose-pine") ~= nil,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(get_colorscheme())
    end
  },

  {
    "projekt0n/github-nvim-theme",
    cond = string.find(get_colorscheme(), "github") ~= nil,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(get_colorscheme())
    end,
  },

  {
    "olimorris/onedarkpro.nvim",
    cond = get_colorscheme() == "onelight" or get_colorscheme() == "onedark",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedarkpro").setup {
        plugins = {
          nvim_tree = true,
        },
        highlights = {
          NvimTreeNormal = { bg = "${cursorline}" },
          NvimTreeCursorLine = { bg = "${selection}" },
          NvimTreeNormalNC = { bg = "${cursorline}" },
          NvimTreeCursorLineNC = { bg = "${selection}" },
        },
        options = {
          cursorline = true,
        },
      }
      vim.cmd.colorscheme(get_colorscheme())
    end
  },

  {
    "EdenEast/nightfox.nvim",
    cond = get_colorscheme() == "nightfox",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nightfox")
    end
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    cond = get_colorscheme() == "catppuccin",
    lazy = false,
    priority = 1000,
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
      vim.opt.background = get_system_appearance()
      vim.cmd.colorscheme("catppuccin")
    end
  },

  {
    "savq/melange-nvim",
    cond = get_colorscheme() == "melange",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = get_system_appearance()
      vim.cmd.colorscheme("melange")
    end
  }
}
