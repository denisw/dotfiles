return {
  {
    "nvim-mini/mini.diff",
    version = "*",
    config = function()
      require("mini.diff").setup({
        view = {
          -- style = "sign",
        },
      })

      vim.keymap.set("n", "<leader>gd", MiniDiff.toggle_overlay)
    end,
  },
}
