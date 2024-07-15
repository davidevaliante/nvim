-- Define the base colors
local base_colors = {
  color_1 = '#7400b8', -- french-violet
  color_2 = '#6930c3', -- grape
  color_3 = '#5e60ce', -- slate-blue
  color_4 = '#5390d9', -- united-nations-blue
  color_5 = '#4ea8de', -- picton-blue
  color_6 = '#48bfe3', -- aero
  color_7 = '#56cfe1', -- sky-blue
  color_8 = '#64dfdf', -- tiffany-blue
  color_9 = '#72efdd', -- turquoise
  color_10 = '#80ffdb' -- aquamarine
}

-- Define the custom colors using the base colors
local custom = {
  bg = '#1f1f1f',                                                                                                                                                                                                                  -- Dark background
  bg_dark = '#1a1a1a',                                                                                                                                                                                                             -- Even darker background
  bg_float = '#2a2a2a',                                                                                                                                                                                                            -- Dark background for floating windows
  bg_highlight = '#3a3a3a',                                                                                                                                                                                                        -- Slightly lighter for highlights
  bg_popup = '#2a2a2a',                                                                                                                                                                                                            -- Dark background for popups
  bg_search = '#4a4a4a',                                                                                                                                                                                                           -- Dark search background
  bg_sidebar = '#2a2a2a',                                                                                                                                                                                                          -- Dark sidebar background
  bg_statusline = '#2a2a2a',                                                                                                                                                                                                       -- Dark status line background
  bg_visual = '#3a3a3a',                                                                                                                                                                                                           -- Visual mode background
  black = '#1a1a1a',                                                                                                                                                                                                               -- Black color
  blue = base_colors.color_5,                                                                                                                                                                                                      -- picton-blue
  blue0 = base_colors.color_6,                                                                                                                                                                                                     -- aero
  blue1 = base_colors.color_5,                                                                                                                                                                                                     -- Same as picton-blue
  blue2 = base_colors.color_6,                                                                                                                                                                                                     -- Same as aero
  blue5 = base_colors.color_5,                                                                                                                                                                                                     -- Same as picton-blue
  blue6 = base_colors.color_2,                                                                                                                                                                                                     -- grape
  blue7 = base_colors.color_3,                                                                                                                                                                                                     -- slate-blue
  border = '#1f1f4f',                                                                                                                                                                                                              -- Dark border
  border_highlight = base_colors.color_4,                                                                                                                                                                                          -- Highlight border with united-nations-blue
  comment = '#4a4a4a',                                                                                                                                                                                                             -- Dark comment color
  cyan = base_colors.color_7,                                                                                                                                                                                                      -- sky-blue
  dark3 = '#4a4a4a',                                                                                                                                                                                                               -- Dark color
  dark5 = '#3a3a3a',                                                                                                                                                                                                               -- Another dark color
  diff_add = '#3a4a3a',                                                                                                                                                                                                            -- Dark greenish background
  diff_change = '#4a3a3a',                                                                                                                                                                                                         -- Dark reddish background
  diff_delete = '#4a2a2a',                                                                                                                                                                                                         -- Darker reddish background
  diff_text = '#4a3a4a',                                                                                                                                                                                                           -- Mixed dark background
  error = base_colors.color_2,                                                                                                                                                                                                     -- grape for errors
  fg = base_colors.color_1,                                                                                                                                                                                                        -- french-violet for foreground
  fg_dark = '#B0A4A4',                                                                                                                                                                                                             -- Darker foreground
  fg_float = base_colors.color_1,                                                                                                                                                                                                  -- french-violet for floating text
  fg_gutter = '#4a4a4a',                                                                                                                                                                                                           -- Dark gutter
  fg_sidebar = base_colors.color_1,                                                                                                                                                                                                -- french-violet for sidebar
  git_add = '#4a4a2a',                                                                                                                                                                                                             -- Dark yellowish background
  git_change = '#4a4a3a',                                                                                                                                                                                                          -- Dark yellowish background
  git_delete = '#4a3a3a',                                                                                                                                                                                                          -- Dark reddish background
  git_ignore = '#4a4a4a',                                                                                                                                                                                                          -- Dark ignore color
  green = base_colors.color_9,                                                                                                                                                                                                     -- turquoise for green
  green1 = base_colors.color_9,                                                                                                                                                                                                    -- Same as green
  green2 = base_colors.color_10,                                                                                                                                                                                                   -- Same as aquamarine
  hint = base_colors.color_8,                                                                                                                                                                                                      -- tiffany-blue for hints
  info = base_colors.color_7,                                                                                                                                                                                                      -- sky-blue for info
  magenta = base_colors.color_2,                                                                                                                                                                                                   -- grape for magenta
  magenta2 = base_colors.color_3,                                                                                                                                                                                                  -- slate-blue
  none = 'NONE',                                                                                                                                                                                                                   -- No color
  orange = base_colors.color_4,                                                                                                                                                                                                    -- united-nations-blue for orange
  purple = base_colors.color_1,                                                                                                                                                                                                    -- french-violet for purple
  rainbow = { base_colors.color_1, base_colors.color_2, base_colors.color_3, base_colors.color_4, base_colors.color_5, base_colors.color_6, base_colors.color_7, base_colors.color_8, base_colors.color_9, base_colors.color_10 }, -- Rainbow colors
  red = base_colors.color_3,                                                                                                                                                                                                       -- slate-blue for red
  red1 = base_colors.color_2,                                                                                                                                                                                                      -- grape for red1
  teal = base_colors.color_6,                                                                                                                                                                                                      -- aero for teal
  terminal_black = '#1f1f1f',                                                                                                                                                                                                      -- Dark terminal black
  todo = base_colors.color_4,                                                                                                                                                                                                      -- united-nations-blue for todo
  warning = base_colors.color_2,                                                                                                                                                                                                   -- grape for warnings
  yellow = base_colors
      .color_5                                                                                                                                                                                                                     -- picton-blue for yellow
}

return {
  'folke/tokyonight.nvim',
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    on_colors = function(colors)
      for k, v in pairs(custom) do
        colors[k] = v
      end
    end,

    -- borderless telescope
    on_highlights = function(hl, c)
      local prompt = "#2d3149"
      hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.TelescopeBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopePromptNormal = {
        bg = prompt,
      }
      hl.TelescopePromptBorder = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePromptTitle = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePreviewTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopeResultsTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
    end,
  },
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'tokyonight-night'

    -- You can configure highlights by doing something like
    vim.cmd.hi 'Comment gui=none'
  end,
}
