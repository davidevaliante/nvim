-- Code editing keymaps
return function(km)
  -- Move selected blocks
  km.vmap('J', ":m '>+1<CR>gv=gv", { desc = 'Move selected block down' })
  km.vmap('K', ":m '<-2<CR>gv=gv", { desc = 'Move selected block up' })

  -- Window splits
  km.nmap('<leader>vs', ':vsplit<CR>', { desc = 'Create a vertical split' })
end