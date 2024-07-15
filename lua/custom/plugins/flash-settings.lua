-- https://github.com/folke/flash.nvim

return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    jump = {
      autojump = true,
    },
    highlight = {
      backdrop = false,
    },
  },
  keys = require('custom.keymaps').flash,
  config = function()
  end
}
