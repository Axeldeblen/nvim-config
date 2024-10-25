return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp     = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      select_behavior = 'insert',
      preselect = 'item',
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      sources = cmp.config.sources({
        { name = 'luasnip',     priority = 1 },
        { name = 'nvim_lsp',    priority = 2 },
        { name = 'cmp_tabnine', priority = 3 },
        { name = 'buffer',      priority = 4 },
        { name = 'nvim_lua',    priority = 5 },
      }, {
        { name = 'buffer' },
      }),
      snippets = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-j>"] = cmp.mapping.select_next_item({}),
        ["<C-k>"] = cmp.mapping.select_prev_item({}),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = false })
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif require('utils').has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end),
      })
    })
  end
}
