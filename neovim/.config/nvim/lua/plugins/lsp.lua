return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      local null_ls = require("null-ls")

      function executable_condition(name)
        return function(utils)
          return vim.fn.executable(name) == 1
        end
      end

      null_ls.setup {
        sources = {
          null_ls.builtins.code_actions.eslint.with({
            only_local = "node_modules/.bin",
          }),
          null_ls.builtins.diagnostics.eslint.with({
            only_local = "node_modules/.bin",
          }),
          null_ls.builtins.diagnostics.shellcheck.with({
            condition = executable_condition("shellcheck"),
          }),
          null_ls.builtins.diagnostics.ruff.with({
            condition = executable_condition("ruff"),
          }),
          null_ls.builtins.formatting.prettier.with({
            only_local = "node_modules/.bin",
          }),
          null_ls.builtins.formatting.yapf.with({
            condition = executable_condition("yapf"),
          }),
        },
      }
    end
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim"
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

      -- The filetypes where null-ls shoulbd be used for formatting
      -- insead of the main language server"s formatting capabilities.
      local null_ls_format_filetypes = {
        "javascript",
        "typescript",
        "typescriptreact"
      }

      local format = function(bufnr)
        local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
        local prefer_null_ls = false

        for _, ft in ipairs(null_ls_format_filetypes) do
          if ft == filetype then
            prefer_null_ls = true
          end
        end

        vim.lsp.buf.format({
          bufnr = bufnr,
          filter = function(client)
            if prefer_null_ls then
              return client.name == "null-ls"
            else
              return true
            end
          end,
        })
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
        on_attach = on_attach_with_format_on_save,
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
        on_attach = on_attach_with_format_on_save,
      }

      lspconfig.volar.setup {
        capabilities = capabilities,
        on_attach = on_attach_with_format_on_save,
      }
    end
  },
}
