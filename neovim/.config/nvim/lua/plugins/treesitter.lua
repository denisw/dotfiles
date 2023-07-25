return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "rust", "typescript", "tsx", "vue" },
        indent = { enable = true },
      }
    end
  },
}
