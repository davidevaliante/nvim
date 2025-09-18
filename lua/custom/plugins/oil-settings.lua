-- https://github.com/stevearc/oil.nvim

return {
  'stevearc/oil.nvim',
  config = function()
    local safe_setup = require('custom.safe_setup')

    -- Get oil keymaps and ensure C-p opens terminal
    local oil_keymaps = vim.tbl_extend("force", require('custom.keymaps').oil, {
      ["<C-p>"] = function()
        vim.cmd('ToggleTerm direction=float')
      end,
    })

    safe_setup.setup('oil', {
      keymaps = oil_keymaps,
      columns = {
        "icon",
        "mtime",
      },
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true
    })
  end,
}
