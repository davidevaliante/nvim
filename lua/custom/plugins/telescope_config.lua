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
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')
    
    -- Custom action to cycle between find_files and live_grep
    local cycle_picker = function(prompt_bufnr)
      local current_picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
      local prompt_title = current_picker.prompt_title
      local current_query = current_picker:_get_prompt()
      
      actions.close(prompt_bufnr)
      
      if prompt_title == "Find Files" then
        builtin.live_grep({ default_text = current_query })
      elseif prompt_title == "Live Grep" then
        builtin.find_files({ default_text = current_query })
      end
    end
    
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ["<Tab>"] = cycle_picker,
          },
          n = {
            ["<Tab>"] = cycle_picker,
          },
        },
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
  end,
}
