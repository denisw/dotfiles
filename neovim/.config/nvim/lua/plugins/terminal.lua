return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\><C-\>]],
        direction = "float",
      })

      vim.keymap.set("n", [[<C-\>h]], ":ToggleTerm direction=horizontal<CR>", { silent = true })
      vim.keymap.set(
        "n",
        [[<C-\>v]],
        ":ToggleTerm direction=vertical size=60<CR>",
        { silent = true }
      )

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", [[<C-\><C-\>]], ":ToggleTerm<CR>", opts)
        vim.keymap.set("t", [[<C-\>k]], "<Cmd>wincmd k<CR>", opts)
      end

      vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
    end,
  },
}
