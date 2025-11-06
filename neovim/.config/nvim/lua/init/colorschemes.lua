-------------------------------------------------------------------------------
-- Preferences
-------------------------------------------------------------------------------

-- The colorscheme to load at startup.
local default_colorscheme = "catppuccin-mocha"

--------------------------------------------------------------------------------
-- Catppuccin
--------------------------------------------------------------------------------

MiniDeps.add("catppuccin/nvim")

require("catppuccin").setup({
  background = {
    light = "latte",
    dark = "mocha",
  },
  term_colors = true,
  integrations = {
    mason = true,
  },
})

--------------------------------------------------------------------------------
-- GitHub
--------------------------------------------------------------------------------

MiniDeps.add("projekt0n/github-nvim-theme")

require("github-theme").setup()

--------------------------------------------------------------------------------
-- Load default colorscheme
--------------------------------------------------------------------------------

vim.cmd.colorscheme(default_colorscheme)
