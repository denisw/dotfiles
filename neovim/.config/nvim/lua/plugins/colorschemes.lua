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

local function load_shared_colorscheme()
  local f = loadfile(os.getenv("HOME") .. "/.config/my/colorscheme.lua")
  if f then
    local config = f()
    local mapping = config.mappings[config.colorscheme]
    return mapping.neovim
  else
    return nil
  end
end

colorscheme = load_shared_colorscheme() or "tokyonight"

return {
  {
    "folke/tokyonight.nvim",
    cond = string.find(colorscheme, "tokyonight") ~= nil,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end
  },

  {
    "Mofiqul/dracula.nvim",
    cond = colorscheme == "dracula",
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
    cond = string.find(colorscheme, "rose-pine") ~= nil,
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_create_user_command("Light", function()
        vim.cmd.colorscheme("rose-pine-dawn")
      end, {})

      vim.api.nvim_create_user_command("Dark", function()
        vim.cmd.colorscheme("rose-pine-main")
      end, {})

      if get_system_appearance() == "light" then
        vim.cmd.Light()
      else
        vim.cmd.Dark()
      end
    end
  },

  {
    'projekt0n/github-nvim-theme',
    cond = string.find(colorscheme, "github") ~= nil,
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup({
        -- ...
      })

      vim.api.nvim_create_user_command("Light", function()
        vim.opt.background = "light"
        vim.cmd.colorscheme("github_light")
      end, {})

      vim.api.nvim_create_user_command("Dark", function()
        vim.opt.background = "dark"
        vim.cmd.colorscheme("github_dark")
      end, {})

      if get_system_appearance() == "light" then
        vim.cmd.Light()
      else
        vim.cmd.Dark()
      end
    end,
  },

  {
    "olimorris/onedarkpro.nvim",
    cond = colorscheme == "onelight" or colorscheme == "onedark",
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
      vim.api.nvim_create_user_command("Light", function()
        vim.opt.background = "light"
        vim.cmd.colorscheme("onelight")
      end, {})
      vim.api.nvim_create_user_command("Dark", function()
        vim.opt.background = "dark"
        vim.cmd.colorscheme("onedark")
      end, {})
      if get_system_appearance() == "light" then
        vim.cmd.Light()
      else
        vim.cmd.Dark()
      end
    end
  },

  {
    "EdenEast/nightfox.nvim",
    cond = colorscheme == "nightfox",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nightfox")
    end
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    cond = colorscheme == "catppucin",
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
      if get_system_appearance() == 'light' then
        vim.opt.background = 'light'
      else
        vim.opt.background = 'dark'
      end
      vim.cmd.colorscheme('catppuccin')
    end
  },

  {
    "savq/melange-nvim",
    cond = colorscheme == "melange",
    lazy = false,
    priority = 1000,
    config = function()
      if get_system_appearance() == "light" then
        vim.opt.background = "light"
      else
        vim.opt.background = "dark"
      end
      vim.cmd.colorscheme("melange")
    end
  }
}
