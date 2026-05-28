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

    -- Pin Telescope's main bg to the editor bg (oxocarbon base00 = #161616)
    -- so kitty, the editor, and Telescope all share one background.
    -- Borders use base01 (≈ #2a2a2a), one shade lighter, so the float still
    -- has a visible outline against the flat surrounding bg.
    local editor_bg = '#161616'
    local border    = '#2a2a2a'
    vim.api.nvim_set_hl(0, 'TelescopeNormal',       { bg = editor_bg })
    vim.api.nvim_set_hl(0, 'TelescopeBorder',       { fg = border, bg = editor_bg })
    vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = editor_bg, bg = editor_bg })

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
    vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = 'NONE' })
    
    -- Terminal tab highlights
    vim.api.nvim_set_hl(0, 'TabLineSel', {
      fg = "#161616",
      bg = "#ee5396",
      bold = true,
    })
    
    vim.api.nvim_set_hl(0, 'TabLine', {
      fg = "#6f6f6f",
      bg = "NONE",
    })
    
    vim.api.nvim_set_hl(0, 'TabLineFill', {
      fg = "#525252",
      bg = "NONE",
    })
  end
}
