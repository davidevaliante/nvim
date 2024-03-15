-- https://github.com/akinsho/toggleterm.nvim

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    highlights = {
      FloatBorder = {
        guifg = '#631075',
        guibg = 'NONE',
        blend = 100,
      },
    },
    float_opts = {
      border = 'curved',
    },
  },
}
