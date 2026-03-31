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
-- Folding
-------------------------------------------------------------------------------

-- Open all folds by default when opening a buffer.
vim.o.foldlevelstart = 99

-- Enable folding support in Markdown buffers.
vim.g.markdown_folding = 1

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
-- Keymap
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

vim.pack.add({
  -- (Dependencies)
  "https://github.com/nvim-lua/plenary.nvim", -- Utility functions
  "https://github.com/MunifTanjim/nui.nvim", -- UI component library
  "https://github.com/nvim-tree/nvim-web-devicons", -- File and directory icons

  -- Colorschemes
  "https://github.com/catppuccin/nvim",
  "https://github.com/edeneast/nightfox.nvim",

  -- Mini.nvim
  "https://github.com/nvim-mini/mini.nvim",

  -- Editing
  "https://github.com/tpope/vim-rsi", -- Readline-style key bindings
  "https://github.com/stevearc/conform.nvim", -- Format on save

  -- Language Servers
  "https://github.com/neovim/nvim-lspconfig", -- Language server configs
  "https://github.com/mason-org/mason.nvim", -- Install language servers
  "https://github.com/mason-org/mason.nvim", -- Install language servers
  "https://github.com/mason-org/mason-lspconfig.nvim", -- Mason + lspconfig

  -- Navigation
  "https://github.com/ibhagwan/fzf-lua", -- Picker for files and other things
  "https://github.com/stevearc/oil.nvim", -- File explorer
  "https://github.com/dyng/ctrlsf.vim", -- Directory-wide search & replace
  "https://github.com/nvim-neo-tree/neo-tree.nvim", -- File tree (sidebar)

  -- Terminal
  "https://github.com/akinsho/toggleterm.nvim", -- Persistent toggleable term
})

-- Colorschemes ===============================================================

local default_colorscheme = "catppuccin-mocha"

require("catppuccin").setup({
  background = {
    light = "latte",
    dark = "mocha",
  },
  term_colors = true,
  integrations = {
    mason = true,
  },
})

vim.cmd.colorscheme(default_colorscheme)

-- Mini.nvim ==================================================================

require("mini.bufremove").setup()
require("mini.git").setup()
require("mini.pairs").setup()
require("mini.pick").setup()
require("mini.surround").setup()

require("mini.diff").setup({
  view = {
    style = "sign",
  },
})
vim.keymap.set("n", "<leader>gd", MiniDiff.toggle_overlay)

require("mini.trailspace").setup()
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require("mini.trailspace").trim()
  end,
})

-- Editing ====================================================================

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

-- Language Servers ===========================================================

-- Helpers

local augroup = vim.api.nvim_create_augroup("my.lsp", { clear = false })
local on_attach_callbacks = { ["*"] = {} }

local function on_attach(name, callback)
  on_attach_callbacks[name] = on_attach_callbacks[name] or {}
  table.insert(on_attach_callbacks[name], callback)
end

local function format_on_save(client, bufnr)
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function(args)
      vim.lsp.buf.format({
        bufnr = bufnr,
        id = client.id,
        timeout_ms = 1000,
      })
    end,
  })
end

local function enable_lsp_completion(client, buf)
  if client:supports_method("textDocument/completion") then
    vim.cmd("set completeopt+=menuone,noinsert,popup")
    vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
  end
end

-- Autocommands

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
    for _, name in ipairs({ "*", client.name }) do
      for _, callback in ipairs(on_attach_callbacks[name] or {}) do
        callback(client, event.buf)
      end
    end
  end,
})

-- Server Configurations

-- All languages
on_attach("*", enable_lsp_completion)

-- C++
vim.lsp.enable("clangd")
on_attach("clangd", function(client, bufnr)
  format_on_save(client, bufnr)
  vim.keymap.set("n", "<leader>hh", ":LspClangdSwitchSourceHeader<cr>", bufopts)
end)

-- Go
vim.lsp.enable("gopls")
on_attach("gopls", format_on_save)

-- Java
vim.lsp.enable("jdtls")

-- JavaScript / TypeScript
vim.lsp.enable("eslint")
vim.lsp.enable("ts_ls")

-- Prisma
vim.lsp.enable("prismals")
on_attach("prismals", format_on_save)

-- PHP
vim.lsp.enable("phpactor")

-- Python
vim.lsp.enable("basedpyright")
vim.lsp.enable("ruff")
on_attach("ruff", format_on_save)

-- Ruby
vim.lsp.enable("ruby_lsp")
on_attach("ruby_lsp", format_on_save)

-- Rust
vim.lsp.enable("rust_analyzer")
on_attach("rust_analyzer", format_on_save)
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
      },
    },
  },
})

-- Tailwind CSS
vim.lsp.enable("tailwindcss")

-- Terraform
vim.lsp.enable("terraformls")

-- Vue
vim.lsp.enable("vue_ls")

-- Mason

require("mason").setup()

require("mason-lspconfig").setup({
  automatic_enable = false,
  ensure_installed = {
    "basedpyright",
    "eslint",
    "ts_ls",
  },
})

-- Navigation =================================================================

-- fzf-lua
require("fzf-lua").setup({
  winopts = {
    width = 80,
  },
  files = {
    formatter = "path.filename_first",
    previewer = false,
    cwd_prompt = false,
  },
})
vim.keymap.set("n", "<c-p>", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<cr>")

-- oil.nvim
require("oil").setup({
  view_options = {
    show_hidden = true,
  },
})
vim.keymap.set("n", "-", "<cmd>Oil<cr>")

-- ctrlsf.vim
vim.keymap.set("n", "<leader>s", ":CtrlSF ")

-- neo-tree.nvim
vim.keymap.set("n", "<leader>tt", "<cmd>Neotree<cr>")
vim.keymap.set("n", "<leader>tc", "<cmd>Neotree close<cr>")

-- Terminal ===================================================================

require("toggleterm").setup({
  open_mapping = [[<C-\><C-\>]],
  direction = "float",
})
