-- Keymap loader - integrates modular keymap system
local M = {}
local km = require('core.keymaps')

-- Load all modular keymap files
function M.load_modular_keymaps()
  local keymap_modules = {
    'basic',
    'navigation',
    'buffers',
    'editing',
    'terminal',
    'git',
    'lsp',
    'telescope',
    'plugins',
    'whisper',
  }

  -- Register each module
  for _, module_name in ipairs(keymap_modules) do
    local ok, module = pcall(require, 'keymaps.' .. module_name)
    if ok and type(module) == 'function' then
      km.register_module(module_name, module)
    else
      vim.notify(string.format("Failed to load keymap module: %s", module_name), vim.log.levels.WARN)
    end
  end

  -- Load all registered modules
  local result = km.load_all_modules()

  -- Only notify on failures
  if not result.success and #result.failed > 0 then
    vim.notify(string.format("Failed to load keymap modules: %s", table.concat(result.failed, ", ")), vim.log.levels.ERROR)
  end
end

return M