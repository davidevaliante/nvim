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
      -- game-service splits handlers by //go:build DEBUG vs !DEBUG. gopls can
      -- only analyze one build config; without this it defaults to the !DEBUG
      -- side and reports "no package metadata" for every DEBUG-tagged file
      -- (round_paid_debug_v2.go, round_debug.go, feature_debug.go, ...).
      -- Building with the DEBUG tag restores LSP features in those files;
      -- only round_prod.go (!DEBUG) is left unanalyzed.
      buildFlags = { '-tags=DEBUG' },
    },
  },
}
