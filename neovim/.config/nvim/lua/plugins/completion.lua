-- completion.lua:
-- Plugins and configuration for auto-completion.

return {
  -- Use nvim-cmp as completion engine.
  -- https://github.com/hrsh7th/nvim-cmp
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')

      cmp.setup {
        snippet = {
          expand = function(args)
            require('snippy').expand_snippet(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'snippy' },
        })
      }

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  },

  -- LSP completion source.
  -- https://github.com/hrsh7th/cmp-nvim-lsp
  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = { 'hrsh7th/nvim-cmp' }
  },

  -- Buffer word completion source.
  -- https://github.com/hrsh7th/cmp-buffer
  {
    'hrsh7th/cmp-buffer',
    dependencies = { 'hrsh7th/nvim-cmp' },
  },

  -- Path completion source.
  -- https://github.com/hrsh7th/cmp-path
  {
    'hrsh7th/cmp-path',
    dependencies = { 'hrsh7th/nvim-cmp' },
  },

  -- Command line completion source.
  -- https://github.com/hrsh7th/cmp-cmdline
  {
    'hrsh7th/cmp-cmdline',
    dependencies = { 'hrsh7th/nvim-cmp' },
  },

  -- Snippet completion source powered by Snippy.
  -- https://github.com/dcampos/cmp-snippy
  {
    'dcampos/cmp-snippy',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'dcampos/nvim-snippy',
    },
  },
}
