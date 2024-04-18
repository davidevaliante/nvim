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
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = {
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

    -- -- custom
    -- vim.api.nvim_set_keymap('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
    -- vim.api.nvim_set_keymap('n', '<leader>ga', builtin.live_grep, { desc = '[G]lobal [A]rep' })
    -- vim.api.nvim_set_keymap('n', '<leader>fz', builtin.current_buffer_fuzzy_find, { desc = '[F]ind in current buffer [Z]fuzzly' })

    require('which-key').register({
      f = {
        name = '[F]ind', -- optional group name
        f = { builtin.find_files, '[F]ind [F]iles' },
        z = { builtin.current_buffer_fuzzy_find, '[F]ind in current buffer [Z]fuzzly' },
      },
      g = {
        g = { builtin.live_grep, '[G]lobal [G]rep' },
      },
      s = {
        h = { builtin.help_tags, '[S]earch [H]elp tags' },
        k = { builtin.keymaps, '[S]earch [K]eymaps' },
        w = { builtin.grep_string, '[S]earch [W]ord under cursor' },
        n = {
          function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
          end,
          '[S]earch [N]vim configuration',
        },
      },
    }, { prefix = '<leader>' })

    -- Slightly advanced example of overriding default behavior and theme
    -- vim.keymap.set('n', '<leader>/', function()
    --   -- You can pass additional configuration to telescope to change theme, layout, etc.
    --   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    --     winblend = 10,
    --     previewer = false,
    --   })
    -- end, { desc = '[/] Fuzzily search in current buffer' })
  end,
}
