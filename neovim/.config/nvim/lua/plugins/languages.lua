return {
  "prisma/vim-prisma",

  -- https://github.com/hashivim/vim-terraform
  "hashivim/vim-terraform",

  -- https://github.com/carlsmedstad/vim-bicep
  "carlsmedstad/vim-bicep",

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
}
