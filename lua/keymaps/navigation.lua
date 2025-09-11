-- Navigation and file management keymaps
return function(km)
  -- Oil file manager
  km.plugin_map('oil', 'n', '<C-n>', ':Oil<CR>', 
    { desc = 'Opens Oil file manager' },
    { rhs = ':Ex<CR>', opts = { desc = 'Open netrw (fallback)' }})
  
  -- Neotree
  km.plugin_map('neo-tree', 'n', '<C-t>', ':Neotree toggle=true<CR>',
    { desc = 'Toggle Neotree' })
  
  -- Aerial (code outline)
  km.plugin_map('aerial', 'n', '<C-o><C-l>', ':AerialToggle<CR>',
    { desc = 'Toggle Aerial code outline' })
  
  -- Buffer navigation
  km.nmap('<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
  km.nmap('<S-Tab>', ':bprev<CR>', { desc = 'Previous buffer' })
end