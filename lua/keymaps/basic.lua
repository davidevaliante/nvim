-- Basic editor keymaps
return function(km)
  local settings = require('core.settings')
  
  -- Get escape sequence from settings
  local escape_seq = settings.get('keybinds.escape_sequence') or 'jj'
  
  -- General editing
  km.imap(escape_seq, '<Esc>', { desc = 'Exit INSERT mode' })
  km.nmap('<leader>qq', ':qa!<CR>', { desc = 'Exit Nvim (Close all Buffers)' })
  km.nmap('<C-q>', '@q', { desc = 'Repeats the macro registered on q' })
  
  -- Save operations
  km.imap('<C-S>', '<Esc>:w<CR>', { desc = 'Write buffer and exit INSERT mode' })
  km.nmap('<C-S>', ':w<CR>', { desc = 'Write buffer' })
  
  -- Buffer navigation
  km.nmap('<C-d><C-d>', ':bdelete<CR>', { desc = 'Closes the current buffer' })
  
  -- Split management
  km.nmap('<leader>vs', ':vsplit<CR>', { desc = 'Create a vertical split' })
  
  -- Code movement
  km.vmap('J', ":m '>+1<CR>gv=gv", { desc = 'Move selected block down' })
  km.vmap('K', ":m '<-2<CR>gv=gv", { desc = 'Move selected block up' })
  
  -- Clear search highlighting
  km.nmap('<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlighting' })
  
  -- Window navigation
  km.nmap('<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  km.nmap('<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  km.nmap('<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  km.nmap('<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
end