-- Terminal and utility keymaps
return function(km)
  -- ToggleTerm integration
  km.plugin_map('toggleterm', 'n', '<C-\\>', ':ToggleTerm direction=tab<CR>',
    { desc = 'Open terminal in tab' },
    { rhs = ':terminal<CR>', opts = { desc = 'Open built-in terminal (fallback)' }})
  
  km.plugin_map('toggleterm', 'n', '<C-p>', ':ToggleTerm direction=float<CR>',
    { desc = 'Open floating terminal' },
    { rhs = ':terminal<CR>', opts = { desc = 'Open built-in terminal (fallback)' }})
  
  km.plugin_map('toggleterm', 't', '<C-p>', '<C-\\><C-n>:ToggleTerm direction=float<CR>',
    { desc = 'Toggle floating terminal from terminal mode' })
  
  -- ZenMode for focused writing
  km.plugin_map('zen-mode', 'n', '<C-z>', ':ZenMode<CR>',
    { desc = 'Toggle ZenMode' })
  
  -- Flash for enhanced navigation
  km.plugin_map('flash', 'n', 's', function() 
    require("flash").jump() 
  end, { desc = 'Flash jump' })
  
  km.plugin_map('flash', 'n', 'S', function() 
    require("flash").treesitter() 
  end, { desc = 'Flash treesitter' })
  
  km.plugin_map('flash', 'o', 'r', function() 
    require("flash").remote() 
  end, { desc = 'Remote Flash' })
  
  km.plugin_map('flash', {'o', 'x'}, 'R', function() 
    require("flash").treesitter_search() 
  end, { desc = 'Treesitter search' })
  
  km.plugin_map('flash', 'c', '<c-s>', function() 
    require("flash").toggle() 
  end, { desc = 'Toggle Flash search' })
  
  km.plugin_map('flash', {'n', 'x', 'o'}, '<leader>ss', function() 
    require("flash").jump({ continue = true }) 
  end, { desc = 'Flash continue last search' })
end