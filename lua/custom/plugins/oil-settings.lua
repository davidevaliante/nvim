-- https://github.com/stevearc/oil.nvim

return {
  'stevearc/oil.nvim',
  opts = {
    keymaps = require('custom.keymaps').oil,
    columns = {
      "icon",
      "mtime",
    },
    view_options = {
      show_hidden = true,
    },
    skip_confirm_for_simple_edits = true
  },
}
