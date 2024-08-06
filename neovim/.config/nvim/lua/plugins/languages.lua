return {
  "prisma/vim-prisma",

  -- Terraform syntax highlighting and format
  -- https://github.com/hashivim/vim-terraform
  "hashivim/vim-terraform",

  -- Bicep syntax highlighting
  -- https://github.com/carlsmedstad/vim-bicep
  "carlsmedstad/vim-bicep",

  -- F# development tools
  -- https://github.com/ionide/Ionide-vim
  "ionide/Ionide-vim",

  -- Interactive development environment
  -- https://github.com/Olical/conjure
  -- https://github.com/clojure-vim/vim-jack-in
  {
    "Olical/conjure",
    init = function()
      vim.g["conjure#filetypes"] = {
        "clojure",
        "fennel",
        "lisp",
        "racket",
        "scheme",
      }
    end,
  },

  -- Vim port of cider-jack-in for Clojure
  -- https://github.com/clojure-vim/vim-jack-in
  "clojure-vim/vim-jack-in",

  -- Open Jupyter notebooks as Python files.
  -- https://github.com/GCBallesteros/jupytext.nvim
  {
    "GCBallesteros/jupytext.nvim",
    config = true,
  },
}
