-- Safe loading of utils
local utils_ok, utils = pcall(require, 'custom.utils')
local notifiGrappleToggle = utils_ok and utils.notifiGrappleToggle or function() end
local jumpToGrappleIndex = utils_ok and utils.jumpToGrappleIndex or function() end
-- [Custom keymaps]

-- General
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit INSERT mode' })
vim.keymap.set('n', '<leader>qq', ':qa!<CR>', { desc = 'Exit Nvim (Close all Buffers)' })
vim.keymap.set('n', '<C-q>', '@q', { desc = 'Repeats the macro registered on h' })

-- Lsp
vim.keymap.set('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>',
  { desc = 'Goes to definition under cursor', silent = true })
vim.keymap.set('n', '<leader>gi', ':Telescope lsp_implementations<CR>',
  { desc = 'Goes to implementation under cursor', silent = true })


-- Buffers
vim.keymap.set('i', '<C-S>', '<Esc>:w<CR>', { desc = 'Write buffer and exit INSERT mode', silent = true })
vim.keymap.set('n', '<C-S>', ':w<CR>', { desc = 'Write buffer' })
vim.keymap.set('n', '<C-m><C-m>', notifiGrappleToggle, { desc = 'Add current buffer to Grapple' })
-- Grapple keymaps (only if available)
if utils_ok then
  vim.keymap.set('n', '<Tab>', ':Grapple cycle_tags next<CR>', { desc = 'Cycle next Grapple tag', silent = true })
  vim.keymap.set('n', '<S-Tab>', ':Grapple cycle_tags prev<CR>', { desc = 'Cycle previous Grapple tag', silent = true })
else
  -- Fallback buffer navigation
  vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Goes to the next buffer', silent = true })
  vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { desc = 'Goes to the previous buffer', silent = true })
end

vim.keymap.set('n', '<C-d><C-d>', ':bdelete<CR>', { desc = 'Closes the current buffer', silent = true })
vim.keymap.set('n', '<C-o><C-l>', ':AerialToggle<CR>', { desc = 'Toggles Aerial side panel', silent = true })

-- Select grapple index (only if available)
if utils_ok then
  for i = 1, 9 do
    vim.keymap.set('n', '<A-' .. i .. '>', function()
      jumpToGrappleIndex(i)
    end, { noremap = true, silent = true })
  end
end

-- Code Editing
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected block up', silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected block up', silent = true })
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>', { desc = 'Create a vertical split', silent = true })

-- Flash keymaps
-- stylua: ignore
local flash = {
  { "s",          mode = { "n", "x", "o" }, function() require("flash").jump() end,                    desc = "Flash" },
  { "S",          mode = { "n", "x", "o" }, function() require("flash").treesitter() end,              desc = "Flash Treesitter" },
  { "r",          mode = "o",               function() require("flash").remote() end,                  desc = "Remote Flash" },
  { "R",          mode = { "o", "x" },      function() require("flash").treesitter_search() end,       desc = "Treesitter Search" },
  { "<c-s>",      mode = { "c" },           function() require("flash").toggle() end,                  desc = "Toggle Flash Search" },
  { "<leader>ss", mode = { "n", "x", "o" }, function() require("flash").jump({ continue = true }) end, desc = "Flash continue last search" },
}

-- Oil keymap - set globally since Oil handles its own internal keymaps
vim.keymap.set('n', '<C-n>', ':Oil<CR>', { desc = 'Opens Oil tree', silent = true })

vim.keymap.set('n', '<C-t>', ':Neotree toggle=true<CR>', { desc = 'Opens the neo tree view', silent = true })

vim.keymap.set('n', '<C-\\>', ':ToggleTerm direction=tab<CR>', { desc = 'Opens the terminal in a tab', silent = true })
vim.keymap.set('n', '<C-p>', ':ToggleTerm direction=float<CR>', { desc = 'Opens a floating terminal', silent = true })
vim.keymap.set('t', '<C-p>', '<C-\\><C-n>:ToggleTerm direction=float<CR>',
  { desc = 'Toggles the currently float terminal', silent = true })

vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Opens LazyGit', silent = true })

vim.keymap.set('n', '<leader>dw', ':DiffviewOpen<CR>', { desc = 'Opens Diffview', silent = true })
vim.keymap.set('n', '<leader>dwc', ':DiffviewClose<CR>', { desc = 'Closes Diffview', silent = true })

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
vim.keymap.set('n', '<leader>xx', ':Trouble diagnostics toggle focus=true<CR>',
  { desc = 'Open diagnostic [Q]uickfix list' })


-- Telescope
vim.keymap.set('n', '<leader>ff', function() require("telescope.builtin").find_files() end, { desc = "Find Files" })
vim.keymap.set('n', '<leader>fz', function() require("telescope.builtin").current_buffer_fuzzy_find() end,
  { desc = "Current buffer fuzzy find" })
vim.keymap.set('n', '<leader>gg', function() require("telescope.builtin").live_grep() end, { desc = "Global Grep" })

-- Oil keymaps
local oil = {
  ["g?"] = "actions.show_help",
  ["<CR>"] = "actions.select",
  ["<C-s>"] = function() vim.cmd 'w' end,
  ["<C-h>"] = "actions.select_split",
  ["<C-t>"] = "actions.select_tab",
  ["<C-p>"] = "actions.preview",
  ["<C-c>"] = "actions.close",
  ["<C-l>"] = "actions.refresh",
  ["-"] = "actions.parent",
  ["_"] = "actions.open_cwd",
  ["`"] = "actions.cd",
  ["~"] = "actions.tcd",
  ["gs"] = "actions.change_sort",
  ["gx"] = "actions.open_external",
  ["g."] = "actions.toggle_hidden",
  ["g\\"] = "actions.toggle_trash",
}

return {
  flash = flash,
  oil = oil,
}
