return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("trouble").setup {}
      options = {silent = true, noremap = true}
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", options)
      vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", options)
      vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", options)
      vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", options)
      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", options)
      vim.keymap.set("n", "<leader>xj", function() require("trouble").next({skip_groups = true, jump = true}) end, options)
      vim.keymap.set("n", "<leader>xk", function() require("trouble").previous({skip_groups = true, jump = true}) end, options)
      vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", options)
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("lualine").setup {}
    end
  },
}
