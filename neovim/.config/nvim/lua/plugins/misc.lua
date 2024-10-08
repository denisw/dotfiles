return {
  "tpope/vim-dispatch",
  "tpope/vim-eunuch",

  -- Commands for removing a buffer without closing the window.
  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-bufremove.md
  {
    "echasnovski/mini.bufremove",
    version = "*",
    keys = {
      { "<leader>bd", ":lua MiniBufremove.delete()<cr>" },
    },
    config = function()
      require("mini.bufremove").setup()
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
