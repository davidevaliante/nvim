-- [Custom keymaps]

-- General
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit INSERT mode' })
vim.keymap.set('n', '<leader>qq', ':qa!<CR>', { desc = 'Exit Nvim (Close all Buffers)' })
vim.keymap.set('n', '<C-n>', ':Ex<CR>', { desc = 'exits to netrw' })
vim.keymap.set('n', '<C-m>', '@h', { desc = 'Repeats the macro registered on h' })

-- Lsp
vim.keymap.set('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>',
  { desc = 'Goes to definition under cursor', silent = true })

-- Buffers
vim.keymap.set('i', '<C-S>', '<Esc>:w<CR>', { desc = 'Write buffer and exit INSERT mode' })
vim.keymap.set('n', '<C-S>', ':w<CR>', { desc = 'Write buffer and exit INSERT mode' })
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Goes to the next buffer', silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { desc = 'Goes to the previous buffer', silent = true })
vim.keymap.set('n', '<C-d><C-d>', ':bdelete<CR>', { desc = 'Closes the current buffer', silent = true })

-- Code Editing
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected block up', silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected block up', silent = true })
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>', { desc = 'Create a vertical split', silent = true })

-- stylua: ignore
local flash = {
  { "s",          mode = { "n", "x", "o" }, function() require("flash").jump() end,                    desc = "Flash" },
  { "S",          mode = { "n", "x", "o" }, function() require("flash").treesitter() end,              desc = "Flash Treesitter" },
  { "r",          mode = "o",               function() require("flash").remote() end,                  desc = "Remote Flash" },
  { "R",          mode = { "o", "x" },      function() require("flash").treesitter_search() end,       desc = "Treesitter Search" },
  { "<c-s>",      mode = { "c" },           function() require("flash").toggle() end,                  desc = "Toggle Flash Search" },
  { "<leader>ss", mode = { "n", "x", "o" }, function() require("flash").jump({ continue = true }) end, desc = "Flash continue last search" },
}

-- Oil
vim.keymap.set('n', '<C-n>', ':Oil<CR>', { desc = 'Opens Oil tree', silent = true })
local oil = {
  ['<C-s>'] = function()
    vim.cmd 'w'
  end,
}

-- Neotreee
vim.keymap.set('n', '<C-t>', ':Neotree toggle=true<CR>', { desc = 'Opens the neo tree view', silent = true })

-- Toggle term
vim.keymap.set('n', '<C-\\>', ':ToggleTerm direction=tab<CR>', { desc = 'Opens the terminal in a tab', silent = true })
vim.keymap.set('n', '<C-p>', ':ToggleTerm direction=float<CR>', { desc = 'Opens a floating terminal', silent = true })
vim.keymap.set('t', '<C-p>', '<C-\\><C-n>:ToggleTerm direction=float<CR>',
  { desc = 'Toggles the currently float terminal', silent = true })

-- LazyGit
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Opens LazyGit', silent = true })

-- Zenmode
vim.keymap.set('n', '<C-z>', ':ZenMode<CR>', { desc = 'Toggles ZenMode', silent = true })

-- [Kickstart Keymaps]

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

return {
  flash = flash,
  oil = oil,
}
