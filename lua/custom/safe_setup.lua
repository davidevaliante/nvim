-- Legacy safe setup wrapper - now uses core.loader
local loader = require('core.loader')

local M = {}

-- Backward compatibility wrapper
function M.setup(module_name, config)
  return loader.safe_setup(module_name, config, { required = false })
end

return M