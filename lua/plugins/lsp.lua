return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'eslint',
        'svelte',
        'rust_analyzer',
        'lua_ls',
        'gopls'
      },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          }
        end
      }
    })

    local keymap = vim.keymap.set
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, remap = false }

        keymap('n', '(', function() vim.diagnostic.goto_prev() end, opts)
        keymap('n', ')', function() vim.diagnostic.goto_next() end, opts)

        keymap('n', 'K', function() vim.lsp.buf.hover() end, opts)
        keymap('i', '<C-d>', function() vim.lsp.buf.signature_help() end, opts)
        keymap('n', '<leader>gd', function() vim.lsp.buf.definition() end, opts)
        keymap('n', '<leader>gr', function() vim.lsp.buf.references() end, opts)
        keymap('n', '<Leader>d', function() vim.diagnostic.open_float() end, opts)

        keymap('n', '<leader>gv', function()
          vim.cmd('vsplit')
          vim.lsp.buf.definition()
        end, opts)

        keymap('n', '<leader>gy', function()
          vim.cmd('vsplit')
          vim.lsp.buf.type_definition()
        end, opts)

        vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            underline = true,
            signs = true,
          }
        )
      end,
    })
  end
}
