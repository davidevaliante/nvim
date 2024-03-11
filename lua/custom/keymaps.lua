-- Custom keymaps
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit INSERT mode' })
vim.keymap.set('i', '<C-S>', '<Esc>:w<CR>', { desc = 'Write buffer and exit INSERT mode' })
vim.keymap.set('n', '<C-S>', ':w<CR>', { desc = 'Write buffer and exit INSERT mode' })
vim.keymap.set('n', '<leader>qq', ':qa<CR>', { desc = 'Exit Nvim (Close all Buffers)' })

-- Kickstart Keymaps

-- General
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
