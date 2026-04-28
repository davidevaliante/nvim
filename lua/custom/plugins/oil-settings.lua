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
      ["<C-o>"] = {
        callback = function()
          local dir = require("oil").get_current_dir()
          if not dir then return end
          if vim.fn.has("wsl") == 1 then
            local win_path = vim.fn.system("wslpath -w " .. vim.fn.shellescape(dir)):gsub("\n$", "")
            vim.fn.system("explorer.exe " .. vim.fn.shellescape(win_path))
          else
            vim.ui.open(dir)
          end
        end,
        desc = "Open current directory in system file explorer",
      },
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
