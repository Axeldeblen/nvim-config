return {
  "stevearc/conform.nvim",
  dependencies = {
    "pmizio/typescript-tools.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local utils = require('utils')

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        vue = { "prettier" },
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        rust = { "rustfmt" },
        terraform = { "terraform_fmt" },
      },
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
    })

    local default_format = function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end

    local typescript_format = function()
      pcall(function()
        default_format()
        vim.lsp.buf.code_action({
          filter = function(action)
            return action.title == "Organize Imports"
          end,
          apply = true,
        })
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

    require("typescript-tools").setup({})
  end
}
