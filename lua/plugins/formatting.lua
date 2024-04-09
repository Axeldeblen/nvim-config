return {
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = {
    'jose-elias-alvarez/typescript.nvim',
  },
  config = function()
    local null_ls = require('null-ls')
    local utils = require('utils')
    local typescript = require('typescript')

    local default_format = function()
      vim.lsp.buf.format({ async = false })
    end

    local typescript_format = function()
      pcall(function()
        default_format()
        typescript.actions.organizeImports({ sync = true })
      end)
    end

    vim.keymap.set('n', '<leader>f', function()
      local js_file_types = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'svelte'
      }

      if utils.includes(js_file_types, vim.bo.filetype) then
        typescript_format()
      else
        default_format()
      end
    end, { noremap = true, silent = true })

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = {
        '*.graphql',
        '*.go',
        '*.lua',
        '*.rs',
        '*.tf'
      },
      callback = default_format
    })

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = {
        '*.ts',
        '*.tsx',
        --'*.js',
        '*.cjs',
        '*.mjs',
        '*.tsx',
        '*.svelte',
      },
      callback = typescript_format
    })

    typescript.setup({})
    null_ls.setup({
      sources = {
        -- GO
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.code_actions.impl,

        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Terraform
        null_ls.builtins.formatting.terraform_fmt,

        -- Generic
        null_ls.builtins.completion.spell,

        -- JS/TS
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.prettierd.with({
          filetypes = {
            'graphql',
            'html',
            'json',
            'yaml',
            'markdown',
            'vue',
            'typescript',
            'typescriptreact',
            'tsx',
            'javascript',
            'javascriptreact',
            'svelte'
          }
        })
      }
    })
  end
}
