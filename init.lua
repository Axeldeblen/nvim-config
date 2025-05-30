local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('config')
require('config.remaps')
require('config.surround')
require('lazy').setup('plugins', {
  change_detection = { notify = false }
})
require('kanagawa').load('wave')

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    require('telescope.builtin').git_files()
  end,
})

vim.api.nvim_create_autocmd('BugWritePost', {
  pattern = { "*.lua" },
  callback = function()
    if string.find(vim.fn.expand('%:p', vi.fn.stdpath('config')), 'nvim') then
      vim.cmd('source %')
      vim.notify("Reloaded!", vim.log.levels.INFO, {
        title = 'Neovim Config',
      })
    end
  end,
})
