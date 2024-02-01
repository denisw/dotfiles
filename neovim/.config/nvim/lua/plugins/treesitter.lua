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
        ensure_installed = {
          "c",
          "cpp",
          "java",
          "json",
          "lua",
          "python",
          "rust",
          "typescript",
          "tsx",
          "vue",
          "yaml",
        },
        highlight = {
          enable = true,
          disable = { "vimdoc" },
        },
        indent = { enable = true },
      }
    end
  },
}
