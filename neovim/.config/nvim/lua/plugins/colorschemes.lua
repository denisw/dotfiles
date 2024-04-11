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
  return "light"
end

function get_colorscheme()
  return "dawnfox"
end

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

      vim.o.background = get_background()
      vim.cmd.colorscheme(get_colorscheme())
    end,
  },

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
    "navarasu/onedark.nvim",
    lazy = string.find(get_colorscheme(), "onedark") == nil,
    config = function()
      vim.o.background = get_background()
      require('onedark').load()
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
