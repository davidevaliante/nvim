-- Core module loader with error handling and logging
local M = {}

-- Configuration for the loader
M.config = {
  silent_errors = false,
  log_level = vim.log.levels.WARN,
  required_modules = {},
  optional_modules = {},
}

-- Safe module loading with comprehensive error handling
function M.safe_require(module_name, opts)
  opts = opts or {}
  local success, result = pcall(require, module_name)
  
  if not success then
    local error_msg = string.format("Failed to load module '%s': %s", module_name, result)
    
    if opts.required then
      vim.notify(error_msg, vim.log.levels.ERROR)
      if opts.fallback then
        vim.notify(string.format("Using fallback for '%s'", module_name), vim.log.levels.WARN)
        return opts.fallback
      end
      return nil
    else
      if not M.config.silent_errors then
        vim.notify(error_msg, M.config.log_level)
      end
      return opts.fallback
    end
  end
  
  return result
end

-- Setup function for a module with validation
function M.safe_setup(module_name, config, opts)
  opts = opts or {}
  local module = M.safe_require(module_name, opts)
  
  if not module then
    return false
  end
  
  if type(module) ~= 'table' then
    local error_msg = string.format("Module '%s' is not a table (got %s)", module_name, type(module))
    vim.notify(error_msg, vim.log.levels.WARN)
    return false
  end
  
  if not module.setup then
    local error_msg = string.format("Module '%s' does not have a setup function", module_name)
    if opts.required then
      vim.notify(error_msg, vim.log.levels.ERROR)
    else
      vim.notify(error_msg, vim.log.levels.WARN)
    end
    return false
  end
  
  local setup_success, setup_error = pcall(module.setup, config)
  if not setup_success then
    local error_msg = string.format("Failed to setup '%s': %s", module_name, setup_error)
    vim.notify(error_msg, vim.log.levels.ERROR)
    return false
  end
  
  return true
end

-- Load multiple modules with dependency management
function M.load_modules(modules)
  local loaded = {}
  local failed = {}
  
  for _, module_config in ipairs(modules) do
    local name = module_config.name or module_config[1]
    local config = module_config.config
    local opts = module_config.opts or {}
    
    if M.safe_setup(name, config, opts) then
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

-- Execute function with error handling
function M.safe_call(func, context, ...)
  if type(func) ~= 'function' then
    vim.notify(string.format("Expected function in context '%s', got %s", context or "unknown", type(func)), vim.log.levels.ERROR)
    return false, "Not a function"
  end
  
  local success, result = pcall(func, ...)
  if not success then
    local error_msg = string.format("Error in %s: %s", context or "function call", result)
    vim.notify(error_msg, vim.log.levels.ERROR)
    return false, result
  end
  
  return true, result
end

return M