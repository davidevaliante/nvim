-- https://github.com/stevearc/oil.nvim

return {
  'stevearc/oil.nvim',
  opts = {
    keymaps = require('custom.keymaps').oil,
    view_options = {
      show_hidden = true,
    },
  },
}
