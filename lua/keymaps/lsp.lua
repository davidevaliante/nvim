-- LSP-related keymaps
return function(km)
  -- Smart go to definition/implementation function
  local smart_goto = function()
    -- For Go, we need a different approach since gopls handles this differently
    local filetype = vim.bo.filetype
    
    if filetype == 'go' then
      -- For Go, check if cursor is on a type that could be an interface
      local params = vim.lsp.util.make_position_params()
      
      -- First get the definition to check if it's an interface
      vim.lsp.buf_request(0, 'textDocument/definition', params, function(_, def_result)
        if not def_result or vim.tbl_count(def_result) == 0 then
          vim.lsp.buf.definition()
          return
        end
        
        -- Get the first definition location
        local def = def_result[1]
        local bufnr = vim.uri_to_bufnr(def.uri or def.targetUri)
        
        -- Load the buffer if not already loaded
        vim.fn.bufload(bufnr)
        
        -- Get the line at the definition
        local def_line = vim.api.nvim_buf_get_lines(bufnr, def.range.start.line, def.range.start.line + 1, false)[1]
        
        -- Check if the definition is an interface
        if def_line and def_line:match("type%s+%w+%s+interface") then
          -- It's an interface, show implementations
          local has_telescope = pcall(require, 'telescope')
          if has_telescope then
            require('telescope.builtin').lsp_implementations()
          else
            vim.lsp.buf.implementation()
          end
        else
          -- Not an interface, go to definition
          vim.lsp.buf.definition()
        end
      end)
    else
      -- For other languages, try implementations first
      local params = vim.lsp.util.make_position_params()
      
      vim.lsp.buf_request(0, 'textDocument/implementation', params, function(_, result)
        if result and vim.tbl_count(result) > 0 then
          -- Implementations found, show them
          local has_telescope = pcall(require, 'telescope')
          if has_telescope then
            require('telescope.builtin').lsp_implementations()
          else
            vim.lsp.buf.implementation()
          end
        else
          -- No implementations, go to definition
          vim.lsp.buf.definition()
        end
      end)
    end
  end
  
  -- Basic LSP navigation with smart detection
  km.nmap('<leader>gd', smart_goto, { desc = 'Smart go to definition/implementation' })
  
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