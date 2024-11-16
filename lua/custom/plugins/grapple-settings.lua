-- https://github.com/cbochs/grapple.nvim
return {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true }
  },
  keys = {
    { "<C-m>", "<cmd>Grapple toggle_tags<CR>", desc = "Grapple open tags window" },
  },
  win_opts = {
    title = "Marks"
  }
}
