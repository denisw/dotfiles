--------------------------------------------------------------------------------
-- toggleterm.nvim - Toggleable persistent terminal buffers
--------------------------------------------------------------------------------

MiniDeps.add("akinsho/toggleterm.nvim")

require("toggleterm").setup({
  open_mapping = [[<C-\><C-\>]],
  direction = "float",
})
