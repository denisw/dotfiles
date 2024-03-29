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

function get_background()
  -- return get_system_appearance()
  return "dark"
end

function get_colorscheme()
  return "dracula"
end

return {
  {
    "miikanissi/modus-themes.nvim",
    lazy = string.find(get_colorscheme(), "modus_") == nil,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(get_colorscheme())
    end
  },

  {
    "folke/tokyonight.nvim",
    lazy = string.find(get_colorscheme(), "tokyonight") == nil,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme(get_colorscheme())
    end
  },

  {
    "Mofiqul/dracula.nvim",
    lazy = get_colorscheme() ~= "dracula",
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme("dracula")
    end
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = string.find(get_colorscheme(), "rose-pine") == nil,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(get_colorscheme())
    end
  },

  {
    "projekt0n/github-nvim-theme",
    lazy = string.find(get_colorscheme(), "github") == nil,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(get_colorscheme())
    end,
  },

  {
    "olimorris/onedarkpro.nvim",
    lazy = get_colorscheme() ~= "onelight" and get_colorscheme() ~= "onedark",
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
    lazy = get_colorscheme() ~= "nightfox",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nightfox")
    end
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = string.find(get_colorscheme(), "catppuccin") == nil,
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
      vim.opt.background = get_background()
      vim.cmd.colorscheme("catppuccin-latte")
    end
  },

  {
    "savq/melange-nvim",
    lazy = get_colorscheme() ~= "melange",
    priority = 1000,
    config = function()
      vim.opt.background = get_background()
      vim.cmd.colorscheme("melange")
    end
  }
}
