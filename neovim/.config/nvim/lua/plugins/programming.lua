return {
  {
    "mhartington/formatter.nvim",
    lazy = false,
    config = function()
      require("formatter").setup {
        filetype = {
          python = {
            require("formatter.filetypes.python").black,
          },
          javascript = {
            require("formatter.filetypes.javascript").prettier,
          },
          typescript = function()
            result = require("formatter.filetypes.typescript").prettier()
            result["exe"] = "node_modules/.bin/prettier"
            return result
          end,
          typescriptreact = function()
            result = require("formatter.filetypes.typescriptreact").prettier()
            result["exe"] = "node_modules/.bin/prettier"
            return result
          end,
        },
      }

      local augroup = vim.api.nvim_create_augroup("Format", {
        clear = true,
      })

      for _, pattern in ipairs({ "*.js", "*.py", "*.ts", "*.tsx" }) do
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
          pattern = pattern,
          group = augroup,
          command = "FormatWrite"
        })
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      automatic_installation = true,
    },
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

      lspconfig.eslint.setup {
        capabilities = capabilities,
        on_attach = on_attach,
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
