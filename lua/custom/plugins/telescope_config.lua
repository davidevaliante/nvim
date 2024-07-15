-- https://github.com/nvim-telescope/telescope.nvim
return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          '%.webp$',
          '%.png$',
          '%.skel$',
          '%.jpg$',
          '%.jpeg$',
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'

    require('which-key').add({
      { "<leader>ff", builtin.find_files,                desc = "[F]ind [F]iles" },
      { "<leader>fz", builtin.current_buffer_fuzzy_find, desc = "[F]ind in the current buffer [Z]fuzzly" },
      { "<leader>gg", builtin.live_grep,                 desc = "[G]lobal [G]rep" }
    })
  end,
}
