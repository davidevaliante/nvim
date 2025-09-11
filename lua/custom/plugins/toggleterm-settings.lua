-- https://github.com/akinsho/toggleterm.nvim

local terminal_names = {}

-- Terminal tab management module
local TerminalTabs = {}

-- Helper function to check if a terminal is open
function TerminalTabs.is_terminal_open(term_id)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
      local ok, buf_term_id = pcall(vim.api.nvim_buf_get_var, buf, "toggle_number")
      if ok and buf_term_id == term_id then
        return true
      end
    end
  end
  return false
end

-- Get list of open terminal IDs
function TerminalTabs.get_open_terminals()
  local open_terminals = {}
  for i = 1, 4 do
    if TerminalTabs.is_terminal_open(i) then
      table.insert(open_terminals, i)
    end
  end
  return open_terminals
end

-- Generate winbar for current terminal
function TerminalTabs.generate_winbar(current_term_id)
  local open_terminals = TerminalTabs.get_open_terminals()
  
  -- Only show tabs if more than one terminal is open
  if #open_terminals <= 1 then
    return ""
  end
  
  local tabs = {}
  for i, term_id in ipairs(open_terminals) do
    local name = terminal_names[term_id] or "T" .. term_id
    local is_current = term_id == current_term_id
    
    if is_current then
      table.insert(tabs, "%#ToggleTermTabActive# " .. name .. " %*")
    else
      table.insert(tabs, "%#ToggleTermTabInactive# " .. name .. " %*")
    end
  end
  
  return table.concat(tabs, "%#ToggleTermTabSeparator#│%*")
end

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    local toggleterm = require('toggleterm')
    
    -- Oxocarbon colors
    local colors = {
      bg = "#161616",
      fg = "#ffffff",
      cyan = "#08bdba",
      blue = "#78a9ff",
      pink = "#ee5396",
      green = "#42be65",
      purple = "#be95ff",
      grey = "#525252",
      light_grey = "#6f6f6f",
      dark_grey = "#262626",
    }
    
    toggleterm.setup({
      persist_mode = false,
      persist_size = true,
      hidden = true,
      start_in_insert = true,
      highlights = {
        FloatBorder = {
          guifg = colors.pink,
          guibg = 'NONE',
        },
        TermCursor = {
          guibg = colors.green
        },
      },
      float_opts = {
        border = 'rounded',
        winblend = 0,
        width = function()
          return math.floor(vim.o.columns * 0.9)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.9)
        end,
      },
      on_create = function(term)
        -- Set default name if not exists
        if not terminal_names[term.id] then
          terminal_names[term.id] = "T" .. term.id
        end
      end,
      on_open = function(term)
        -- Store terminal info in buffer variables
        vim.api.nvim_buf_set_var(term.bufnr, "toggle_number", term.id)
        vim.api.nvim_buf_set_var(term.bufnr, "terminal_name", terminal_names[term.id] or "T" .. term.id)
        
        -- Set winbar with terminal tabs
        vim.wo.winbar = TerminalTabs.generate_winbar(term.id)
        
        -- Terminal buffer keymaps
        local opts = { noremap = true, silent = true, buffer = term.bufnr }
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        
        -- Terminal rename keybinding
        vim.keymap.set('t', '<C-r>', function()
          vim.cmd('stopinsert')
          vim.ui.input({ prompt = 'Rename terminal to: ', default = terminal_names[term.id] }, function(input)
            if input and input ~= "" then
              terminal_names[term.id] = input
              vim.b.terminal_name = input
              -- Refresh winbar after rename
              vim.wo.winbar = TerminalTabs.generate_winbar(term.id)
              vim.notify("Terminal " .. term.id .. " renamed to: " .. input, vim.log.levels.INFO)
            end
            vim.cmd('startinsert')
          end)
        end, opts)
      end,
    })
    
    -- Terminal tab highlight groups
    vim.api.nvim_set_hl(0, 'ToggleTermTabActive', {
      fg = colors.bg,
      bg = colors.pink,
      bold = true,
    })
    
    vim.api.nvim_set_hl(0, 'ToggleTermTabInactive', {
      fg = colors.light_grey,
      bg = 'NONE',
    })
    
    vim.api.nvim_set_hl(0, 'ToggleTermTabSeparator', {
      fg = colors.grey,
      bg = 'NONE',
    })
    
    -- Ensure winbar background is transparent
    vim.api.nvim_set_hl(0, 'WinBar', {
      fg = 'NONE',
      bg = 'NONE',
    })
    
    vim.api.nvim_set_hl(0, 'WinBarNC', {
      fg = 'NONE', 
      bg = 'NONE',
    })
    
    -- Terminal rename command
    vim.api.nvim_create_user_command('TermRename', function(opts)
      local term_id = vim.b.toggle_number
      if term_id then
        terminal_names[term_id] = opts.args
        vim.b.terminal_name = opts.args
        -- Refresh winbar after rename
        vim.wo.winbar = TerminalTabs.generate_winbar(term_id)
        vim.notify("Terminal " .. term_id .. " renamed to: " .. opts.args, vim.log.levels.INFO)
      else
        vim.notify("Not in a terminal buffer", vim.log.levels.ERROR)
      end
    end, { nargs = 1, desc = "Rename current terminal" })
  end,
}