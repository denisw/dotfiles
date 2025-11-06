MiniDeps.add({
  source = "neovim/nvim-lspconfig",
  depends = { "mason-org/mason.nvim" },
})

MiniDeps.add({
  source = "mason-org/mason-lspconfig.nvim",
  depends = { "mason-org/mason.nvim" },
})

-------------------------------------------------------------------------------
--- Helpers
-------------------------------------------------------------------------------

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

-------------------------------------------------------------------------------
--- Autocommands
-------------------------------------------------------------------------------

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

-------------------------------------------------------------------------------
--- Language Servers
-------------------------------------------------------------------------------

MiniDeps.later(function()
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
end)

-------------------------------------------------------------------------------
--- Mason
-------------------------------------------------------------------------------

MiniDeps.later(function()
  require("mason").setup()

  require("mason-lspconfig").setup({
    automatic_enable = false,
    ensure_installed = {
      "basedpyright",
      "eslint",
      "ts_ls",
    },
  })
end)
