return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    local harpoon = require('harpoon')

    harpoon:setup()

    vim.keymap.set('n', '<leader>h', function() harpoon:list():append() end)
    vim.keymap.set('n', '<C-a>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end)
    vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end)
    vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end)
    vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end)

    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set('n', '<C-v>', function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-t>', function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })
  end
}
