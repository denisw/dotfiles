return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<C-\><C-\>]],
        direction = "float",
      }

      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set("t", [[<C-\><C-\>]], ":ToggleTerm<CR>", opts)
        vim.keymap.set("t", [[<C-\>k]], "<Cmd>wincmd k<CR>", opts)
      end

      vim.cmd "autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()"
    end,
  },
}
