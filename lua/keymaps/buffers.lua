-- Buffer management keymaps
return function(km)
  -- Save buffers
  km.imap('<C-S>', '<Esc>:w<CR>', { desc = 'Write buffer and exit INSERT mode' })
  km.nmap('<C-S>', ':w<CR>', { desc = 'Write buffer' })

  -- Buffer navigation
  km.nmap('<Tab>', ':bnext<CR>', { desc = 'Goes to the next buffer' })
  km.nmap('<S-Tab>', ':bprev<CR>', { desc = 'Goes to the previous buffer' })

  -- Buffer operations
  km.nmap('<C-d><C-d>', ':bdelete<CR>', { desc = 'Closes the current buffer' })
end