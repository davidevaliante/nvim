-- Modular keymap management system
local M = {}
local loader = require('core.loader')
local settings = require('core.settings')

-- Storage for keymap modules
M.modules = {}
M.registered_keymaps = {}

-- Helper function to create keymaps with consistent options
function M.map(mode, lhs, rhs, opts)
  opts = opts or {}
  
  -- Default options
  local default_opts = {
    noremap = true,
    silent = true,
  }
  
  -- Merge with provided options
  opts = vim.tbl_extend('force', default_opts, opts)
  
  -- Set the keymap
  vim.keymap.set(mode, lhs, rhs, opts)
  
  -- Store for reference
  table.insert(M.registered_keymaps, {
    mode = mode,
    lhs = lhs,
    rhs = rhs,
    opts = opts
  })
end

-- Convenience functions for different modes
function M.nmap(lhs, rhs, opts)
  M.map('n', lhs, rhs, opts)
end

function M.imap(lhs, rhs, opts)
  M.map('i', lhs, rhs, opts)
end

function M.vmap(lhs, rhs, opts)
  M.map('v', lhs, rhs, opts)
end

function M.tmap(lhs, rhs, opts)
  M.map('t', lhs, rhs, opts)
end

function M.cmap(lhs, rhs, opts)
  M.map('c', lhs, rhs, opts)
end

-- Register a keymap module
function M.register_module(name, module_function)
  if type(module_function) ~= 'function' then
    vim.notify(string.format("Keymap module '%s' must be a function", name), vim.log.levels.ERROR)
    return false
  end
  
  M.modules[name] = module_function
  return true
end

-- Load a keymap module safely
function M.load_module(name)
  local module_function = M.modules[name]
  if not module_function then
    vim.notify(string.format("Keymap module '%s' not found", name), vim.log.levels.WARN)
    return false
  end
  
  return loader.safe_call(module_function, string.format("keymap module '%s'", name), M)
end

-- Load all registered modules
function M.load_all_modules()
  local loaded = {}
  local failed = {}
  
  for name, _ in pairs(M.modules) do
    if M.load_module(name) then
      table.insert(loaded, name)
    else
      table.insert(failed, name)
    end
  end
  
  return {
    loaded = loaded,
    failed = failed,
    success = #failed == 0
  }
end

-- Clear all keymaps (useful for reloading)
function M.clear_all()
  for _, keymap in ipairs(M.registered_keymaps) do
    pcall(vim.keymap.del, keymap.mode, keymap.lhs)
  end
  M.registered_keymaps = {}
end

-- Plugin-dependent keymapping with fallbacks
function M.plugin_map(plugin_name, mode, lhs, rhs, opts, fallback)
  -- Check if plugin should be loaded based on settings
  if not settings.is_plugin_enabled(plugin_name) then
    if fallback then
      M.map(mode, lhs, fallback.rhs, fallback.opts or opts)
    end
    return
  end
  
  -- Try to load the plugin to verify it exists
  local plugin = loader.safe_require(plugin_name)
  if plugin then
    M.map(mode, lhs, rhs, opts)
  elseif fallback then
    M.map(mode, lhs, fallback.rhs, fallback.opts or opts)
  end
end

-- Conditional keymapping based on function check
function M.conditional_map(condition_fn, mode, lhs, rhs, opts, fallback)
  if type(condition_fn) == 'function' and condition_fn() then
    M.map(mode, lhs, rhs, opts)
  elseif fallback then
    M.map(mode, lhs, fallback.rhs, fallback.opts or opts)
  end
end

return M