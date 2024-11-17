-- https://github.com/j-hui/fidget.nvim

return {
  "j-hui/fidget.nvim",
  tag = "v1.4.5",
  config = function()
    local fidget = require('fidget')

    vim.keymap.set("n", "B", function()
      fidget.notify("This is also from fidget.notify().", vim.log.levels.WARN)
    end)

    vim.keymap.set("n", "C", function()
      fidget.notify("fidget.notify() supports annotations...", nil, { annote = "MY NOTE", key = "foobar" })
    end)

    vim.keymap.set("n", "D", function()
      fidget.notify(nil, vim.log.levels.ERROR, { annote = "bottom text", key = "foobar" })
      fidget.notify("... and overwriting notifications.", vim.log.levels.WARN, { annote = "YOUR AD HERE" })
    end)
  end
}
