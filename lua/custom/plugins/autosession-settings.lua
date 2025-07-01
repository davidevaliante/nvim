-- https://github.com/rmagatti/auto-session
return {
  'rmagatti/auto-session',
  config = function()
    local safe_setup = require('custom.safe_setup')
    safe_setup.setup('auto-session', {
      log_level = 'error',
      auto_session_suppress_dirs = { '~/', '/' },
    })
  end,
}
