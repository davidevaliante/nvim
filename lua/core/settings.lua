-- Centralized settings management
local M = {}

-- Default settings that can be overridden
M.defaults = {
  -- UI settings
  ui = {
    theme = "oxocarbon",
    transparency = false,
    show_line_numbers = true,
    relative_numbers = true,
    show_statusline = true,
    show_tabline = true,
  },
  
  -- Editor behavior
  editor = {
    tab_size = 2,
    use_spaces = true,
    auto_save = false,
    wrap_lines = false,
    show_whitespace = true,
    cursor_line = true,
    scroll_offset = 10,
  },
  
  -- Plugin preferences
  plugins = {
    enable_lsp = true,
    enable_treesitter = true,
    enable_telescope = true,
    enable_oil = true,
    enable_git_integration = true,
    enable_terminal = true,
    disabled_plugins = { "avante" }, -- Plugins to disable
  },
  
  -- Keybinding preferences
  keybinds = {
    leader_key = " ",
    local_leader_key = " ",
    escape_sequence = "jj",
    enable_which_key = true,
  },
  
  -- LSP settings
  lsp = {
    auto_format = true,
    show_diagnostics = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  },
  
  -- Performance settings
  performance = {
    lazy_loading = true,
    startup_time_threshold = 100, -- ms
    max_file_size = 1024 * 1024, -- 1MB
  }
}

-- Current settings (starts with defaults)
M.current = vim.deepcopy(M.defaults)

-- Merge user settings with defaults
function M.setup(user_settings)
  user_settings = user_settings or {}
  
  -- Deep merge function
  local function deep_merge(target, source)
    for key, value in pairs(source) do
      if type(value) == "table" and type(target[key]) == "table" then
        deep_merge(target[key], value)
      else
        target[key] = value
      end
    end
  end
  
  deep_merge(M.current, user_settings)
  
  -- Apply vim options based on settings
  M.apply_vim_options()
  
  return M.current
end

-- Apply settings to vim options
function M.apply_vim_options()
  local s = M.current
  
  -- Leader keys
  vim.g.mapleader = s.keybinds.leader_key
  vim.g.maplocalleader = s.keybinds.local_leader_key
  
  -- UI settings
  vim.opt.number = s.ui.show_line_numbers
  vim.opt.relativenumber = s.ui.relative_numbers
  vim.opt.cursorline = s.editor.cursor_line
  vim.opt.laststatus = s.ui.show_statusline and 3 or 0
  
  -- Editor settings
  vim.opt.tabstop = s.editor.tab_size
  vim.opt.shiftwidth = s.editor.tab_size
  vim.opt.expandtab = s.editor.use_spaces
  vim.opt.wrap = s.editor.wrap_lines
  vim.opt.list = s.editor.show_whitespace
  vim.opt.scrolloff = s.editor.scroll_offset
  
  -- LSP diagnostics
  vim.diagnostic.config({
    virtual_text = s.lsp.virtual_text,
    signs = s.lsp.signs,
    update_in_insert = s.lsp.update_in_insert,
  })
end

-- Get a setting value with dot notation (e.g., "ui.theme")
function M.get(path)
  local keys = vim.split(path, ".", { plain = true })
  local value = M.current
  
  for _, key in ipairs(keys) do
    if type(value) ~= "table" or value[key] == nil then
      return nil
    end
    value = value[key]
  end
  
  return value
end

-- Set a setting value with dot notation
function M.set(path, new_value)
  local keys = vim.split(path, ".", { plain = true })
  local target = M.current
  
  for i = 1, #keys - 1 do
    local key = keys[i]
    if type(target[key]) ~= "table" then
      target[key] = {}
    end
    target = target[key]
  end
  
  target[keys[#keys]] = new_value
  
  -- Re-apply vim options if needed
  if vim.startswith(path, "ui.") or vim.startswith(path, "editor.") or vim.startswith(path, "lsp.") then
    M.apply_vim_options()
  end
end

-- Check if a plugin should be loaded
function M.is_plugin_enabled(plugin_name)
  local disabled = M.get("plugins.disabled_plugins") or {}
  for _, disabled_plugin in ipairs(disabled) do
    if disabled_plugin == plugin_name then
      return false
    end
  end
  return true
end

-- Validate settings
function M.validate()
  local errors = {}
  
  -- Validate theme exists
  local theme = M.get("ui.theme")
  if theme and type(theme) ~= "string" then
    table.insert(errors, "ui.theme must be a string")
  end
  
  -- Validate numeric settings
  local numeric_settings = {
    "editor.tab_size",
    "editor.scroll_offset",
    "performance.startup_time_threshold",
    "performance.max_file_size"
  }
  
  for _, setting in ipairs(numeric_settings) do
    local value = M.get(setting)
    if value and type(value) ~= "number" then
      table.insert(errors, string.format("%s must be a number", setting))
    end
  end
  
  return #errors == 0, errors
end

return M