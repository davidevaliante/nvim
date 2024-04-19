return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = {
        auto_trigger = false, -- this is to enable ghost completion
      },
      panel = {
        enabled = false,
      },
    }
  end,
}
