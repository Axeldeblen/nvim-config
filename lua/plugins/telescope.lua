return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    "debugloop/telescope-undo.nvim",
  },
  config = function()
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<C-p>'] = require('telescope.actions.layout').toggle_preview
          }
        },
        preview = {
          hide_on_startup = true
        },
        extensions = {
          undo = {},
        }
      }
    })

    local builtin = require('telescope.builtin')
    local opts = { noremap = true, silent = true }

    require("telescope").load_extension("undo")
    vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

    vim.keymap.set('n', '<C-p>', builtin.git_files, opts)
    vim.keymap.set('n', '<leader><S-p>', builtin.find_files, opts)
    vim.keymap.set('n', '<C-f>', builtin.live_grep, opts)
    vim.keymap.set('n', '<leader>wf', builtin.grep_string, opts)
    vim.keymap.set('n', '<leader><S-f>', function()
      pcall(
        function()
          builtin.grep_string({ search = vim.fn.input('Grep > ') })
        end)
    end, opts)
  end
}
