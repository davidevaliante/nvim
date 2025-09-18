-- Terminal and utility keymaps
return function(km)
  -- ToggleTerm integration
  km.plugin_map('toggleterm', 'n', '<C-\\>', ':ToggleTerm direction=tab<CR>',
    { desc = 'Open terminal in tab' },
    { rhs = ':terminal<CR>', opts = { desc = 'Open built-in terminal (fallback)' } })

  km.plugin_map('toggleterm', 'n', '<C-p>', ':ToggleTerm direction=float<CR>',
    { desc = 'Open floating terminal 1' },
    { rhs = ':terminal<CR>', opts = { desc = 'Open built-in terminal (fallback)' } })

  km.plugin_map('toggleterm', 't', '<C-p>', '<C-\\><C-n>:ToggleTerm direction=float<CR>',
    { desc = 'Toggle floating terminal from terminal mode' })

  -- Additional floating terminals with Alt+number
  km.plugin_map('toggleterm', 'n', '<A-1>', ':1ToggleTerm direction=float<CR>',
    { desc = 'Open floating terminal 1' },
    { rhs = ':terminal<CR>', opts = { desc = 'Open built-in terminal (fallback)' } })

  km.plugin_map('toggleterm', 'n', '<A-2>', ':2ToggleTerm direction=float<CR>',
    { desc = 'Open floating terminal 2' },
    { rhs = ':terminal<CR>', opts = { desc = 'Open built-in terminal (fallback)' } })

  km.plugin_map('toggleterm', 'n', '<A-3>', ':3ToggleTerm direction=float<CR>',
    { desc = 'Open floating terminal 3' },
    { rhs = ':terminal<CR>', opts = { desc = 'Open built-in terminal (fallback)' } })

  km.plugin_map('toggleterm', 'n', '<A-4>', ':4ToggleTerm direction=float<CR>',
    { desc = 'Open floating terminal 4' },
    { rhs = ':terminal<CR>', opts = { desc = 'Open built-in terminal (fallback)' } })

  -- Terminal mode mappings for Alt+number
  km.plugin_map('toggleterm', 't', '<A-1>', '<C-\\><C-n>:1ToggleTerm direction=float<CR>',
    { desc = 'Toggle floating terminal 1 from terminal mode' })

  km.plugin_map('toggleterm', 't', '<A-2>', '<C-\\><C-n>:2ToggleTerm direction=float<CR>',
    { desc = 'Toggle floating terminal 2 from terminal mode' })

  km.plugin_map('toggleterm', 't', '<A-3>', '<C-\\><C-n>:3ToggleTerm direction=float<CR>',
    { desc = 'Toggle floating terminal 3 from terminal mode' })

  km.plugin_map('toggleterm', 't', '<A-4>', '<C-\\><C-n>:4ToggleTerm direction=float<CR>',
    { desc = 'Toggle floating terminal 4 from terminal mode' })

  -- Terminal rename command
  km.plugin_map('toggleterm', 'n', '<leader>tr', ':TermRename ',
    { desc = 'Rename current terminal' })

  -- Navigate between terminals
  km.plugin_map('toggleterm', 'n', '<leader>tn', ':ToggleTermToggleAll<CR>',
    { desc = 'Toggle all terminals' },
    { rhs = ':echo "ToggleTerm not available"<CR>', opts = { desc = 'ToggleTerm not available' } })

  -- Send lines to terminal
  km.plugin_map('toggleterm', 'n', '<leader>ts', ':ToggleTermSendCurrentLine<CR>',
    { desc = 'Send current line to terminal' },
    { rhs = ':echo "ToggleTerm not available"<CR>', opts = { desc = 'ToggleTerm not available' } })

  km.plugin_map('toggleterm', 'v', '<leader>ts', ':ToggleTermSendVisualSelection<CR>',
    { desc = 'Send visual selection to terminal' },
    { rhs = ':echo "ToggleTerm not available"<CR>', opts = { desc = 'ToggleTerm not available' } })

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

  km.plugin_map('flash', { 'o', 'x' }, 'R', function()
    require("flash").treesitter_search()
  end, { desc = 'Treesitter search' })

  km.plugin_map('flash', 'c', '<c-s>', function()
    require("flash").toggle()
  end, { desc = 'Toggle Flash search' })

  km.plugin_map('flash', { 'n', 'x', 'o' }, '<leader>ss', function()
    require("flash").jump({ continue = true })
  end, { desc = 'Flash continue last search' })
end

