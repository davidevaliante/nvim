-- https://github.com/nyoom-engineering/oxocarbon.nvim
return {
  "nyoom-engineering/oxocarbon.nvim",
  -- Add in any other configuration;
  --   event = foo,
  --   config = bar
  --   end,
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'oxocarbon'

    -- You can configure highlights by doing something like
    vim.cmd.hi 'Comment gui=none'
    vim.api.nvim_set_hl(0, 'FlashMatch', {
      fg = "#ee5396",
      bold = true
    })
    vim.api.nvim_set_hl(0, 'FlashLabel', {
      fg = "#08bdba",
      bold = true
    })
    vim.api.nvim_set_hl(0, 'FlashPromptIcon', {
      fg = "#ffffff",
      bold = true
    })

    vim.api.nvim_set_hl(0, 'LspReferenceText', {
      bg = "none",
      bold = true
    })
  end
}
