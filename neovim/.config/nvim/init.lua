-- init.lua
-- ========
--
-- My Neovim configuration. It aims to provide a lightweight IDE-like
-- editing experience, mainly by leveraging Neovim"s support for the
-- Language Server Protocol (LSP).
--
-- NOTE: This configuration assumes that the terminal is configured with
-- a NERD Font (https://www.nerdfonts.com/) so that icons and the status
-- line are displayed correctly.

-------------------------------------------------------------------------------
-- General Options
-------------------------------------------------------------------------------

-- Display line numbers.
vim.o.number = true

-- Ignore case when searching, unless the search term
-- contains at least one capital letter.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Use two-space indentation by default.
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Always show the signcolum.
vim.o.signcolumn = "yes"

-------------------------------------------------------------------------------
-- Diagnostics
-------------------------------------------------------------------------------

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = {
    current_line = true,
    severity = vim.diagnostic.severity.WARNING,
    source = "if_many",
  },
})

-------------------------------------------------------------------------------
-- Built-In Terminal
-------------------------------------------------------------------------------

-- In terminal buffers, start in insert mode and disable line numbers.
vim.cmd("autocmd TermOpen * startinsert")

-------------------------------------------------------------------------------
-- Keyboard Mappings
-------------------------------------------------------------------------------

-- Allow saving with Cmd-S on macOS.
vim.keymap.set("n", "<D-s>", ":w<cr>")

-- Use the space key as <leader> and underscore as <localleader>.
vim.g.mapleader = " "
vim.g.maplocalleader = "_"

-- Use <leader>y and <leader>p as shortcut for clipboard copy and paste.
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

-- Add a mapping for viewing diagnostic details.
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)

-- Add keymappings for opening Neovim config files.
local configpath = vim.fn.stdpath("config")
vim.keymap.set("n", "<leader>v,", "<cmd>e " .. configpath .. "/init.lua<cr>")
vim.keymap.set("n", "<leader>v;", "<cmd>e " .. configpath .. "/lua/init<cr>")
vim.keymap.set("n", "<leader>vf", "<cmd>e " .. configpath .. "/ftplugin<cr>")

-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------

-- mini.nvim (including mini.deps)
require("init.mini")

-- Other
require("init.colorschemes")
require("init.editing")
require("init.lsp")
require("init.navigation")
require("init.terminal")
require("init.treesitter")
