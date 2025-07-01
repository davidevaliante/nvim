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
  
  -- Buffer navigation with grapple integration
  local grapple_available = pcall(require, 'grapple')
  if grapple_available then
    -- Grapple-specific navigation
    km.nmap('<C-m><C-m>', function()
      require('grapple').toggle()
      vim.notify("Toggled grapple mark", vim.log.levels.INFO)
    end, { desc = 'Toggle Grapple mark' })
    
    km.nmap('<Tab>', ':Grapple cycle_tags next<CR>', { desc = 'Cycle next Grapple tag' })
    km.nmap('<S-Tab>', ':Grapple cycle_tags prev<CR>', { desc = 'Cycle previous Grapple tag' })
    
    -- Grapple index selection (1-9)
    for i = 1, 9 do
      km.nmap('<A-' .. i .. '>', function()
        require('grapple').select({ index = i })
      end, { desc = 'Jump to Grapple index ' .. i })
    end
  else
    -- Fallback buffer navigation
    km.nmap('<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
    km.nmap('<S-Tab>', ':bprev<CR>', { desc = 'Previous buffer' })
  end
end