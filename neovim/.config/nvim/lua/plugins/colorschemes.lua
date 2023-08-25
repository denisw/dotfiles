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

return {
  {
    "olimorris/onedarkpro.nvim",
    enabled = true,
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
    enabled = false,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
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
    enabled = false,
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