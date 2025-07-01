-- LSP-related keymaps
return function(km)
  -- Basic LSP navigation
  km.nmap('<leader>gd', ':lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
  
  -- Telescope LSP integration (with fallback)
  km.plugin_map('telescope', 'n', '<leader>gi', ':Telescope lsp_implementations<CR>', 
    { desc = 'Go to implementations' }, 
    { rhs = ':lua vim.lsp.buf.implementation()<CR>', opts = { desc = 'Go to implementations (fallback)' }})
  
  -- Diagnostic navigation
  km.nmap('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  km.nmap(']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  km.nmap('<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })
  km.nmap('<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })
  
  -- Trouble integration (with fallback)
  km.plugin_map('trouble', 'n', '<leader>xx', ':Trouble diagnostics toggle focus=true<CR>',
    { desc = 'Open diagnostics in Trouble' },
    { rhs = ':lua vim.diagnostic.setloclist()<CR>', opts = { desc = 'Open diagnostic quickfix (fallback)' }})
end