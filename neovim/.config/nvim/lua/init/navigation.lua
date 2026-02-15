-----------------------------------------------------------------------------------------
-- fzf-lua.nvim - Picker for files etc., powered by fzf (https://github.com/junegunn/fzf)
-----------------------------------------------------------------------------------------

MiniDeps.add("ibhagwan/fzf-lua")

require("fzf-lua").setup({
  files = {
    formatter = "path.filename_first",
    cwd_prompt = false,
  },
})

vim.keymap.set("n", "<c-p>", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<cr>")

-----------------------------------------------------------------------------------------
-- oil.nvim - File explorer supporting filesystem operations through buffer edits
-----------------------------------------------------------------------------------------

MiniDeps.add("stevearc/oil.nvim")

require("oil").setup({
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set("n", "-", "<cmd>Oil<cr>")

-----------------------------------------------------------------------------------------
-- ctrlsf.vim - Directory-wide search and replace
-----------------------------------------------------------------------------------------

MiniDeps.add("dyng/ctrlsf.vim")

vim.keymap.set("n", "<leader>s", ":CtrlSF ")

-----------------------------------------------------------------------------------------
-- neo-tree.nvim - File explorer
-----------------------------------------------------------------------------------------

MiniDeps.add({
  source = "nvim-neo-tree/neo-tree.nvim",
  checkout = "v3.x",
  depends = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
})

vim.keymap.set("n", "<leader>tt", "<cmd>Neotree<cr>")
vim.keymap.set("n", "<leader>tc", "<cmd>Neotree close<cr>")
