-- https://github.com/stevearc/oil.nvim

return {
  'stevearc/oil.nvim',
  config = function()
    local safe_setup = require('custom.safe_setup')
    safe_setup.setup('oil', {
      keymaps = require('custom.keymaps').oil,
      columns = {
        "icon",
        "mtime",
      },
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true
    })
  end,
}
