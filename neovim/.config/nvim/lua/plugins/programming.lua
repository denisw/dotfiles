return {
  {
    "stevearc/conform.nvim",
    opts = {
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
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      automatic_enable = false,
      ensure_installed = {
        "clangd",
        "eslint",
        "gopls",
        "jdtls",
        "lua_ls",
        "pyright",
        "phpactor",
        "prismals",
        "rust_analyzer",
        "terraformls",
        "ts_ls",
      },
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-go"),
          require("neotest-python"),
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -----------------------------------------------------------------
      --- on_attach()
      -----------------------------------------------------------------

      local augroup = vim.api.nvim_create_augroup("my.lsp", { clear = false })
      local on_attach_callbacks = { ["*"] = {} }

      vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          for _, name in ipairs({ "*", client.name }) do
            for _, callback in ipairs(on_attach_callbacks[name] or {}) do
              callback(client, bufnr)
            end
          end
        end,
      })

      local function on_attach(name, callback)
        on_attach_callbacks[name] = on_attach_callbacks[name] or {}
        table.insert(on_attach_callbacks[name], callback)
      end

      -----------------------------------------------------------------
      --- Common on_attach() callbacks
      -----------------------------------------------------------------

      local function add_extra_lsp_key_mappings(client, bufnr)
        local telescope_builtin = require("telescope.builtin")
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, bufopts)
        vim.keymap.set("n", "<leader>D", telescope_builtin.lsp_type_definitions, bufopts)
        vim.keymap.set("n", "<leader>F", function()
          vim.lsp.buf.format({ async = true })
        end, bufopts)
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

      -----------------------------------------------------------------
      --- Language Servers
      -----------------------------------------------------------------

      -- All languages
      on_attach("*", add_extra_lsp_key_mappings)

      -- C++ (Clang)
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
      vim.lsp.enable("pyright")
      vim.lsp.enable("ruff")
      on_attach("ruff", format_on_save)

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

      -- Terraform
      vim.lsp.enable("terraformls")

      -- Vue
      vim.lsp.enable("volar")
    end,
  },
}
