local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

vim.api.nvim_set_option("clipboard", "unnamed") -- Use system clipboard
-- Basic remaps
keymap({ 'i', 'v', 'n' }, '<C-c>', '<Esc>', default_opts)
keymap({ 'n', 'v' }, 'E', '$', default_opts)

-- Tab navigation
keymap({ 'n', 'v' }, '<C-l>', '<cmd>tabn<CR>', default_opts)
keymap({ 'n', 'v' }, '<C-h>', '<cmd>tabp<CR>', default_opts)

-- Rename variable
keymap('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', default_opts)

-- Visual selection to clipboard
keymap('v', '<leader>C', '"*y', default_opts)

-- Keep cursor in middle
keymap('n', '<C-d>', '<C-d>zz', default_opts)
keymap('n', '<C-u>', '<C-u>zz', default_opts)
keymap('n', 'n', 'nzzzv', default_opts)
keymap('n', 'N', 'Nzzzv', default_opts)

-- Move visual selection
keymap('v', 'J', ":m '>+1<CR>gv=gv", default_opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", default_opts)

-- Restart LSP
keymap('n', '<leader>cr', ':LspRestart<CR>', default_opts)

-- Quit
keymap('n', '<C-x>', '<cmd> :q<CR>')

-- Resize Pane
keymap('n', '>', '<cmd>vertical resize -20<CR>', default_opts)
keymap('n', '<', '<cmd>vertical resize +20<CR>', default_opts)

-- Paste without yank
keymap({ 'n', 'v' }, '<leader>p', '"_dP', default_opts)
keymap({ 'n', 'v' }, '<leader>d', '"_dd', default_opts)

-- Replace word with copy register
keymap("n", "<leader>rw", "viwp", default_opts)

-- Delete inner object parentheses
keymap("n", "dio", "d]}", default_opts)


-- New escape
keymap("i", "jj", "<Esc>", default_opts)
keymap("i", "jf", "<Esc>", default_opts)
keymap("i", "fj", "<Esc>", default_opts)
keymap("i", "Jj", "<Esc>", default_opts)

-- write
keymap("n", "<leader>w", "<cmd>w!<CR>", default_opts)

--import completion
keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", default_opts)

-- Copy current relative filepath to clipboard
keymap('n', '<leader>Y', function() vim.fn.setreg('+', vim.fn.expand('%')) end, default_opts)

-- Caps lock as escape
keymap('i', '<CapsLock>', '<Esc>', default_opts)
