return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      init = function()
        require('lazy.core.loader').disable_rtp_plugin('nvim-treesitter-textobjects')
      end,
    },
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'bash',
        'html',
        'graphql',
        'javascript',
        'jsdoc',
        'json',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'scss',
        'svelte',
        'tailwind-language-server',
        'tsx',
        'terraform',
        'typescript',
        'vimdoc',
        'yaml',
      },
    }
  end
}
