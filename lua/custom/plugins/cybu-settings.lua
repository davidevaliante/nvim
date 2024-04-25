-- https://github.com/ghillb/cybu.nvim
return {
  'ghillb/cybu.nvim',

  config = function()
    local ok, cybu = pcall(require, 'cybu')
    if not ok then
      return
    end

    local opts = {
      style = {
        padding = 3,
        border = 'rounded',
      },
    }

    cybu.setup(opts)

    -- vim.keymap.set('n', '[b', '<Plug>(CybuPrev)')
    -- vim.keymap.set('n', ']b', '<Plug>(CybuNext)')
    vim.keymap.set('n', '<s-tab>', function()
      require('cybu').cycle 'prev'
    end)
    vim.keymap.set('n', '<tab>', function()
      require('cybu').cycle 'next'
    end)
  end,
}
