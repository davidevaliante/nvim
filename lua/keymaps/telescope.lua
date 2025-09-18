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

  -- Grep in uncommitted changes (using <leader>tc for "telescope changes")
  km.nmap('<leader>tc', function()
    -- Get list of files with uncommitted changes
    local cmd = "git diff --name-only --diff-filter=ACMR && git diff --cached --name-only --diff-filter=ACMR"
    local files = vim.fn.systemlist(cmd)

    -- Remove duplicates
    local unique_files = {}
    local seen = {}
    for _, file in ipairs(files) do
      if not seen[file] then
        seen[file] = true
        table.insert(unique_files, file)
      end
    end

    if #unique_files == 0 then
      vim.notify("No uncommitted changes found", vim.log.levels.INFO)
      return
    end

    -- Use live_grep on the uncommitted files
    require("telescope.builtin").live_grep({
      search_dirs = unique_files,
      prompt_title = "Grep in Uncommitted Changes (" .. #unique_files .. " files)",
    })
  end, { desc = "Telescope grep in changes" })
end