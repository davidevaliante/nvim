-- Suppress gopls error responses for go.mod parse errors while typing.
-- gopls returns error code 0 with syntax error messages on every keystroke
-- when go.mod has incomplete directives (e.g. typing a replace directive).
-- These show as red messages in the command line. Real go.mod issues still
-- appear as inline diagnostics.
local _notify = vim.notify
vim.notify = function(msg, level, opts)
  if level == vim.log.levels.ERROR and type(msg) == 'string'
    and msg:match('^gopls: 0:.*go%.mod:') then
    return
  end
  return _notify(msg, level, opts)
end

return {
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
}
