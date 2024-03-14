-- https://github.com/hrsh7th/nvim-cmp

local completion_window_settings = {
  completion = {
    winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
    side_padding = 0,
  },
}

return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    require 'custom.plugins.completion.luasnip-settings',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'windwp/nvim-autopairs',
    'onsails/lspkind.nvim',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local hls = require 'custom.plugins.highlights'
    local lsp_kind = require 'lspkind'
    luasnip.config.setup {}

    cmp.setup {
      window = {
        completion = completion_window_settings,
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          local kind = lsp_kind.cmp_format { mode = 'symbol_text', maxwidth = 50 }(entry, vim_item)
          local strings = vim.split(kind.kind, '%s', { trimempty = true })
          kind.kind = ' ' .. (strings[1] or '') .. ' '
          kind.menu = '    [' .. (strings[2] or '') .. ']'

          return kind
        end,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
    }

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    hls.cmp()
  end,
}
