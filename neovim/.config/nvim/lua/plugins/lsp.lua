return {
  {
    "dense-analysis/ale",
    lazy = false,
    init = function()
      vim.g.ale_disable_lsp = 1
      vim.g.ale_echo_cursor = 0
      vim.g.ale_fix_on_save = 1
      vim.g.ale_use_neovim_diagnostics_api = 1

      vim.g.ale_linters = {
        javascript = { "eslint",  },
        typescript = { "eslint",  },
        typescriptreact = {  "eslint",  },
      }

      vim.g.ale_fixers = {
        javascript = { "prettier",  },
        typescript = { "prettier",  },
        typescriptreact = {  "prettier",  },
      }

      if vim.fn.executable("eslint_d") then
        vim.g.ale_javascript_eslint_executable = "eslint_d"
        vim.g.ale_typescript_eslint_executable = "eslint_d"
      end
    end
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_lsp = require("cmp_nvim_lsp")
      local telescope_builtin = require("telescope.builtin")

      local on_attach = function(client, bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, bufopts)
        vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, bufopts)
        vim.keymap.set("n", "gr", telescope_builtin.lsp_references, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<leader>D", telescope_builtin.lsp_type_definitions, bufopts)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      local format_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local on_attach_with_format_on_save = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_clear_autocmds({
          group = format_augroup,
          buffer = bufnr
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
          group = format_augroup,
          buffer = bufnr,
          callback = function()
            format(bufnr)
          end,
        })
      end

      local capabilities = cmp_lsp.default_capabilities()

      lspconfig.clangd.setup {
        capabilities = capabilities,
        on_attach = function()
          on_attach(client, bufnr)
          local bufopts = { noremap=true, silent=true, buffer=bufnr }
          vim.keymap.set("n", "<leader>h", ":ClangdSwitchSourceHeader<cr>", bufopts)
        end
      }

      lspconfig.prismals.setup {
        capabilities = capabilities,
        on_attach = on_attach_with_format_on_save,
      }

      lspconfig.pyright.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        on_attach = on_attach_with_format_on_save,
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "module"
              }
            }
          }
        }
      }

      lspconfig.solargraph.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lspconfig.tsserver.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lspconfig.volar.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }
    end
  },
}
