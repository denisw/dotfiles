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
    lazy = false,
    priority = 1000,
    config = function()
      require("onedarkpro").setup {
        plugins = {
          neo_tree = true,
        },
        highlights = {
          NeoTreeNormal = { bg = "${cursorline}" },
          NeoTreeCursorLine = { bg = "${selection}" },
          NeoTreeNormalNC = { bg = "${cursorline}" },
          NeoTreeCursorLine = { bg = "${selection}" },
        },
        options = {
          cursorline = true,
        },
      }
      if get_system_appearance() == "light" then
        vim.opt.background = "light"
        vim.cmd.colorscheme('onelight')
      else
        vim.opt.background = "dark"
        vim.cmd.colorscheme('onedark')
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
}
