return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    local safe_setup = require('custom.safe_setup')
    
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    safe_setup.setup('mini.ai', { n_lines = 500 })

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    safe_setup.setup('mini.surround', {
      mappings = {
        add = '<C-a>',       -- Add surrounding in Normal and Visual modes
        delete = '',         -- Delete surrounding
        find = '',           -- Find surrounding (to the right)
        find_left = '',      -- Find surrounding (to the left)
        highlight = '',      -- Highlight surrounding
        replace = '',        -- Replace surrounding
        update_n_lines = '', -- Update `n_lines`

        suffix_last = '',    -- Suffix to search with "prev" method
        suffix_next = '',    -- Suffix to search with "next" method
      },
    })

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    -- local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    -- statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    -- statusline.section_location = function()
    --   return '%2l:%-2v'
    -- end
    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
