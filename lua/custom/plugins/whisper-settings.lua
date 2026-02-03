return {
  'Avi-D-coder/whisper.nvim',
  config = function()
    local whisper = require('whisper')
    whisper.setup({
      model = 'base.en',              -- Good balance for CPU
      threads = 4,                     -- Adjust based on your CPU
      enable_streaming = true,         -- Continuous transcription
      step_ms = 5000,                  -- Process every 5s (responsive)
      length_ms = 8000,                -- Audio buffer
      vad_thold = 0.6,                 -- Voice activity threshold
      language = 'en',
      poll_interval_ms = 5000,         -- Auto-insert interval
      filter_markers = true,           -- Remove [BLANK_AUDIO] etc
      notifications = true,
      keybind = false,                 -- We'll set our own
    })

    -- Expose for lualine integration
    _G.whisper_module = whisper
  end,
  ft = { 'markdown' },                 -- Only load for markdown
}
