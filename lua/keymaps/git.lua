-- Git-related keymaps
return function(km)
  -- LazyGit integration
  km.plugin_map('lazygit', 'n', '<leader>lg', ':LazyGit<CR>',
    { desc = 'Open LazyGit' })
  
  -- Diffview integration
  km.plugin_map('diffview', 'n', '<leader>dw', ':DiffviewOpen<CR>',
    { desc = 'Open Diffview' })
  
  km.plugin_map('diffview', 'n', '<leader>dwc', ':DiffviewClose<CR>',
    { desc = 'Close Diffview' })
  
  -- Git hunks navigation (if gitsigns is available)
  km.plugin_map('gitsigns', 'n', ']c', function()
    if vim.wo.diff then return ']c' end
    vim.schedule(function() require('gitsigns').next_hunk() end)
    return '<Ignore>'
  end, { expr = true, desc = 'Next git hunk' })
  
  km.plugin_map('gitsigns', 'n', '[c', function()
    if vim.wo.diff then return '[c' end
    vim.schedule(function() require('gitsigns').prev_hunk() end)
    return '<Ignore>'
  end, { expr = true, desc = 'Previous git hunk' })
  
  -- Git hunk actions
  km.plugin_map('gitsigns', 'n', '<leader>hs', ':Gitsigns stage_hunk<CR>',
    { desc = 'Stage git hunk' })
  
  km.plugin_map('gitsigns', 'n', '<leader>hr', ':Gitsigns reset_hunk<CR>',
    { desc = 'Reset git hunk' })
  
  km.plugin_map('gitsigns', 'n', '<leader>hp', ':Gitsigns preview_hunk<CR>',
    { desc = 'Preview git hunk' })
  
  km.plugin_map('gitsigns', 'n', '<leader>hb', function()
    require('gitsigns').blame_line({full=true})
  end, { desc = 'Git blame line' })
end