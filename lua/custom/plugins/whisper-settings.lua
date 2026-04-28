return {
  'Avi-D-coder/whisper.nvim',
  lazy = false,
  config = function()
    local whisper = require('whisper')
    whisper.setup({
      model = 'base.en',
      threads = 4,
      enable_streaming = true,
      step_ms = 5000,
      length_ms = 8000,
      vad_thold = 0.6,
      language = 'en',
      poll_interval_ms = 5000,
      filter_markers = true,
      notifications = true,
      keybind = '<F5>',
    })

    _G.whisper_module = whisper
  end,
}
