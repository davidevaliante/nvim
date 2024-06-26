-- https://github.com/jackMort/ChatGPT.nvim
local home = vim.fn.expand '$HOME'
return {
  'jackMort/ChatGPT.nvim',
  event = 'VeryLazy',
  config = function()
    require('chatgpt').setup {
      api_key_cmd = 'gpg --decrypt ' .. home .. '/s/key.txt.gpg',
    }
  end,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'folke/trouble.nvim',
    'nvim-telescope/telescope.nvim',
  },
}
