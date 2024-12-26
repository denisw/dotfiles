return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("lualine").setup({
        sections = {
          lualine_y = {
            { "datetime", style = "%b %d | %H:%M" },
          },
        },
      })
    end,
  },
}
