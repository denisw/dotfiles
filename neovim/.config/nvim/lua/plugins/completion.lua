return {
  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = { 'hrsh7th/nvim-cmp' }
  },

  {
    'hrsh7th/cmp-buffer',
    dependencies = { 'hrsh7th/nvim-cmp' },
  },

  {
    'hrsh7th/cmp-path',
    dependencies = { 'hrsh7th/nvim-cmp' },
  },

  {
    'hrsh7th/cmp-cmdline',
    dependencies = { 'hrsh7th/nvim-cmp' },
  },

  {
    'dcampos/cmp-snippy',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'dcampos/nvim-snippy',
    },
  },

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
    end
  },
}
