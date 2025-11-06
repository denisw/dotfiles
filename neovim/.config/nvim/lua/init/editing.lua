--------------------------------------------------------------------------------
-- conform.nvim - Run formatters on save
--------------------------------------------------------------------------------

MiniDeps.add("stevearc/conform.nvim")

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_after_save = {
    lsp_format = "fallback",
  },
  notify_on_error = false,
})
