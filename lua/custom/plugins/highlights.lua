local function cmpMenuHighlights()
  -- customization for cybu

  -- Customization for Pmenu
  vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#ee5396', fg = '#393939' })
  vim.api.nvim_set_hl(0, 'Pmenu', { fg = '#525252', bg = '#262626' })

  vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = '#82AAFF', bg = 'NONE', bold = true })
  vim.api.nvim_set_hl(0, 'CmpDocNormal', { fg = 'NONE', bg = '#262626' })

  local text_color = '#161616'
  local color_one = '#08bdba'
  local color_two = '#33b1ff'
  local color_three = '#be95ff'
  local color_four = '#be95ff'
  local color_five = '#82cfff'
  local color_six = '#FFAB91'
  local color_seven = '#673AB7'
  local color_eight = '#42be65'

  vim.api.nvim_set_hl(0, 'CybuBackground', { fg = text_color, bg = '#1f1f1f' })
  vim.api.nvim_set_hl(0, 'CybuAdjacent', { fg = '#a8a8a8', bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'CybuBorder', { fg = '#ed9140' })

  -- vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = text_color, bg = 'NONE', strikethrough = true })
  -- vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = text_color, bg = 'NONE', bold = true })
  -- vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = text_color, bg = 'NONE', italic = true })

  vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = text_color, bg = color_one })
  vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = text_color, bg = color_one })
  vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = text_color, bg = color_one })
  --
  vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = text_color, bg = color_two })
  vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = text_color, bg = color_two })
  vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = text_color, bg = color_two })
  --
  vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = text_color, bg = color_three })
  vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = text_color, bg = color_three })
  vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = text_color, bg = color_three })
  --
  vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = text_color, bg = color_four })
  vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = text_color, bg = color_four })
  vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = text_color, bg = color_four })
  vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = text_color, bg = color_four })
  vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = text_color, bg = color_four })
  --
  vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = text_color, bg = color_five })
  vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = text_color, bg = color_five })

  vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = text_color, bg = color_six })
  vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = text_color, bg = color_six })
  vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = text_color, bg = color_six })

  vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = text_color, bg = color_seven })
  vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = text_color, bg = color_seven })
  vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = text_color, bg = color_seven })

  vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = text_color, bg = color_eight })
  vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = text_color, bg = color_eight })
  vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = text_color, bg = color_eight })
end


return {
  cmp = cmpMenuHighlights,
}
