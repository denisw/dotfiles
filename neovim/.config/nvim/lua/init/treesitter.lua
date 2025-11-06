MiniDeps.add({
  source = "nvim-treesitter/nvim-treesitter",
  checkout = "main",
  hooks = {
    post_checkout = function()
      vim.cmd("TSUpdate")
    end,
  },
})

require("nvim-treesitter.install").install({
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
})
