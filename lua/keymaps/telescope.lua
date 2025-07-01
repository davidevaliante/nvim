-- Telescope keymaps
return function(km)
  -- Only set these keymaps if telescope is enabled
  if not require('core.settings').is_plugin_enabled('telescope') then
    return
  end
  
  -- File operations
  km.nmap('<leader>ff', function() 
    require("telescope.builtin").find_files() 
  end, { desc = "Find Files" })
  
  km.nmap('<leader>fz', function() 
    require("telescope.builtin").current_buffer_fuzzy_find() 
  end, { desc = "Current buffer fuzzy find" })
  
  -- Search operations
  km.nmap('<leader>gg', function() 
    require("telescope.builtin").live_grep() 
  end, { desc = "Live Grep" })
  
  -- Additional telescope functionality
  km.nmap('<leader>fb', function()
    require("telescope.builtin").buffers()
  end, { desc = "Find Buffers" })
  
  km.nmap('<leader>fh', function()
    require("telescope.builtin").help_tags()
  end, { desc = "Find Help Tags" })
  
  km.nmap('<leader>fr', function()
    require("telescope.builtin").oldfiles()
  end, { desc = "Find Recent Files" })
end