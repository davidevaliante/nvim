-- https://codeberg.org/jthvai/lavender.nvim
-- return {
--   url = "https://codeberg.org/jthvai/lavender.nvim",
--   branch = "stable", -- versioned tags + docs updates from main
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'lavender'
--   end
-- }


return {
  "diegoulloao/neofusion.nvim",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'neofusion'
  end
}
