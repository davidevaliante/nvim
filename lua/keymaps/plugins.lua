-- Plugin-specific keymaps
return function(km)
  -- Oil
  km.nmap('<C-n>', ':Oil<CR>', { desc = 'Opens Oil tree' })

  -- Neotree
  km.plugin_map('neo-tree', 'n', '<C-t>', ':Neotree toggle=true<CR>', { desc = 'Opens the neo tree view' })

  -- Aerial
  km.plugin_map('aerial', 'n', '<C-o><C-l>', ':AerialToggle<CR>', { desc = 'Toggles Aerial side panel' })

  -- LazyGit
  km.plugin_map('lazygit', 'n', '<leader>lg', ':LazyGit<CR>', { desc = 'Opens LazyGit' })

  -- Diffview
  km.plugin_map('diffview', 'n', '<leader>dw', ':DiffviewOpen<CR>', { desc = 'Opens Diffview' })
  km.plugin_map('diffview', 'n', '<leader>dwc', ':DiffviewClose<CR>', { desc = 'Closes Diffview' })

  -- ZenMode
  km.plugin_map('zen-mode', 'n', '<C-z>', ':ZenMode<CR>', { desc = 'Toggles ZenMode' })

  -- Trouble
  km.nmap('<leader>xx', ':Trouble diagnostics toggle focus=true<CR>', { desc = 'Open diagnostic quickfix list' })
end