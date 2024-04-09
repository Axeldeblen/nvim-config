return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local luasnip       = require('luasnip')
    local vscode_loader = require('luasnip.loaders.from_vscode')

    local list_snips    = function()
      local ft_list = luasnip.available()[vim.o.filetype]
      local ft_snips = {}
      for _, item in pairs(ft_list) do
        ft_snips[item.trigger] = item.name
      end
      print(vim.inspect(ft_snips))
    end

    luasnip.log.set_loglevel('error') -- 'error'|'warn'|'info'|'debug'
    vscode_loader.lazy_load({ paths = '~/.config/nvim/snippets' })

    vim.api.nvim_create_user_command('SnipList', list_snips, {})
    vim.api.nvim_create_user_command('SnipLog', luasnip.log.open, {})
  end
}
