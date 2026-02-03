-- Whisper speech-to-text keymaps (markdown only)
return function(km)
  -- Only create keybinding for markdown files
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function(event)
      vim.keymap.set({ 'n', 'i' }, '<C-S-s>', function()
        local ok, whisper = pcall(require, 'whisper')
        if ok then
          whisper.toggle()
        else
          vim.notify('whisper.nvim not loaded', vim.log.levels.WARN)
        end
      end, { buffer = event.buf, desc = 'Toggle speech-to-text' })
    end,
  })
end
