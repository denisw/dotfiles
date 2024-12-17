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
vim.o.number = true

-- Ignore case when searching, unless the search term
-- contains at least one capital letter.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Use two-space indentation by default.
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Disable line wrapping and tweak horizontal scrolling.
vim.o.wrap = false
vim.o.sidescroll = 1

-- Use the space key as <leader> and underscore as <localleader>.
vim.g.mapleader = " "
vim.g.maplocalleader = "_"

-- Highlight current line.
vim.opt.cursorline = true

-- Always show the sign column.
vim.opt.signcolumn = "yes:1"

-- Enable True Color (24-bit) on all terminals
-- except Terminal.app (which doesn"t support it properly).
if vim.env.TERM_PROGRAM ~= "Apple_Terminal" then
  vim.opt.termguicolors = true
end

-- On macOS, add mapping to save with <Cmd-s> on terminals that support the
-- Kitty keyboard protocol (requires Neovim 0.10+).
if vim.fn.has("macunix") then
  vim.keymap.set("n", "<D-s>", '<cmd>write<cr>', { silent = true })
end

-- In terminal buffers, start in insert mode and disable line numbers.
vim.cmd "autocmd TermOpen * startinsert"
vim.cmd "autocmd TermOpen * setlocal nonumber"

-- Add key mappings to quickly copy/paste to/from the clipboard.
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

-- Add key mapping to quickly open the config files
local configpath = vim.fn.stdpath("config")
vim.keymap.set("n", "<leader>v,", "<cmd>e " .. configpath .. "/init.lua<cr>")
vim.keymap.set("n", "<leader>vp", "<cmd>e " .. configpath .. "/lua/plugins<cr>")
vim.keymap.set("n", "<leader>vf", "<cmd>e " .. configpath .. "/ftplugin<cr>")

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
-- Filetype Detection
-----------------------------------------------------------------------

vim.filetype.add({
  pattern = {
    [".*"] = {
      priority = -math.huge,
      function(path, bufnr)
        local content = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ''

        -- Detect Python scripts without extension by their shebang.
        if vim.regex([[^#!.*python]]):match_str(content) ~= nil then
          return 'python'
        end
      end
    },
  },
})

-----------------------------------------------------------------------
-- Neovide (https://neovide.dev/)
-----------------------------------------------------------------------

if vim.g.neovide then
  -- https://neovide.dev/configuration.html
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_scroll_animation_length = 0.05

  -- https://neovide.dev/faq.html#how-can-i-use-cmd-ccmd-v-to-copy-and-paste
  vim.keymap.set('v', '<D-c>', '"+y')
  vim.keymap.set('n', '<D-v>', '"+P')
  vim.keymap.set('v', '<D-v>', '"+P')
  vim.keymap.set('c', '<D-v>', '<C-R>+')
  vim.keymap.set('i', '<D-v>', '<C-R>+')
end

-----------------------------------------------------------------------
-- Plugins (lazy.vim)
-----------------------------------------------------------------------

require("config.lazy")
