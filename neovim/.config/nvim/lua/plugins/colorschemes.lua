-----------------------------------------------------------------------
-- Preferences
-----------------------------------------------------------------------

local primary_colorscheme = {
  light = "dayfox",
  dark = "catppuccin-mocha",
}

-- Set to "light" or "dark" to force light / dark colorscheme
local override_appearance = nil

-----------------------------------------------------------------------
-- Helpers
-----------------------------------------------------------------------

function get_colorscheme()
  return primary_colorscheme[get_appearance()] or "default"
end

function get_appearance()
  return override_appearance or get_system_appearance()
end

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

-----------------------------------------------------------------------
-- Colorscheme Plugins
-----------------------------------------------------------------------

return {
  {
    "EdenEast/nightfox.nvim",
    lazy = string.find(get_colorscheme(), "fox") == nil,
    priority = 1000,
    config = function()
      local spec = require('nightfox.spec').load(get_colorscheme())

      require('nightfox').setup({
        groups = {
          dawnfox = {
            NvimTreeNormal = { fg = spec.fg1, bg = spec.bg1 },
          },
        },
      })

      vim.cmd.colorscheme(get_colorscheme())
    end,
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
    "projekt0n/github-nvim-theme",
    lazy = string.find(get_colorscheme(), "github") == nil,
    priority = 1000,
    config = function()
      require('github-theme').setup({
        options = {
          darken = {
            sidebars = {
              enabled = true,
            }
          }
        }
      })
      vim.cmd.colorscheme(get_colorscheme())
    end,
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
        term_colors = true,
        integrations = {
          cmp = true,
          lsp_trouble = true,
          neogit = true,
          neotree = true,
        },
      }
      vim.cmd.colorscheme(get_colorscheme())
    end
  },

  {
    "savq/melange-nvim",
    lazy = get_colorscheme() ~= "melange",
    priority = 1000,
    config = function()
      vim.opt.background = get_appearance()
      vim.cmd.colorscheme("melange")
    end
  }
}
