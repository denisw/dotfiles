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

-- Display line numbers.
vim.opt.number = true

-- Ignore case when searching, unless the search term
-- contains at least one capital letter.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use two-space indentation by default.
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Disable line wrapping and tweak horizontal scrolling.
vim.opt.wrap = false
vim.opt.sidescroll = 1

-- Use the space key as <leader>.
vim.g.mapleader = " "

-- Always show the sign column.
vim.opt.signcolumn = "yes:1"

-- Enable True Color (24-bit) on all terminals
-- except Terminal.app (which doesn"t support it properly).
if vim.env.TERM_PROGRAM ~= "Apple_Terminal" then
  vim.opt.termguicolors = true
end

-- In terminal buffers, start in insert mode and disable line numbers.
vim.cmd "autocmd TermOpen * startinsert"
vim.cmd "autocmd TermOpen * setlocal nonumber"

-- Add key mappings to quickly copy/paste to/from the clipboard.
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

-- Add key mapping to quickly open and reload this config file.
local function reload_vimrc()
  vim.cmd "luafile $MYVIMRC"
  vim.cmd "PackerCompile"
end
vim.keymap.set("n", "<leader>v,", "<cmd>e $MYVIMRC<cr>")
vim.keymap.set("n", "<leader>vp", "<cmd>e $XDG_CONFIG_HOME/nvim/lua/plugins<cr>")

-- Configuration and key mappings for the diagnostic frameowrk.
vim.diagnostic.config {
  severity_sort = true,
  virtual_text = {
    severity = vim.diagnostic.severity.ERROR,
    source = "if_many",
  },
  float = {
    format = function(diagnostic)
      return string.format(
        "%s [%s:%s]",
        diagnostic.message,
        diagnostic.source,
        diagnostic.code
      )
    end,
  },
}
vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, bufopts)
vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next, bufopts)
vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev, bufopts)
vim.keymap.set("n", "<leader>el", vim.diagnostic.setqflist, bufopts)

-----------------------------------------------------------------------
-- Plugins
-----------------------------------------------------------------------

-- Initialize lazy.nvim.
-- https://github.com/folke/lazy.nvim#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  change_detection = {
    enabled = true,
    notify = false,
  }
})
