vim.g.mapleader = ' '

vim.opt.background = ''
vim.opt.backspace = 'indent,eol,start'
vim.opt.expandtab = true
vim.opt.foldlevel = 1
vim.opt.foldmethod = 'indent'
vim.opt.hls = true
vim.opt.incsearch = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitright = true
vim.opt.syntax = 'on'
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undodir = vim.fn.expand('~/.nvim/undodir')
vim.opt.undofile = true
vim.opt.updatetime = 1000
vim.opt.wrap = false
vim.wo.foldenable = false

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.multi_cursor_exit_from_visual_mode = true
vim.g.multi_cursor_exit_from_insert_mode = true

