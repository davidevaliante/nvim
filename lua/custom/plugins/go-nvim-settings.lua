-- https://github.com/ray-x/go.nvim
return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
  config = function()
    require('go').setup({
      -- Disable LSP features since you have gopls configured separately
      lsp_cfg = false,
      lsp_on_attach = false,
      lsp_keymaps = false,
      -- Disable diagnostic settings to avoid conflicts
      diagnostic = false,
      -- Focus on struct tag features
      tag_transform = "camelcase", -- can be "snakecase", "camelcase", "lispcase", "pascalcase", "titlecase" or false
      tag_options = "json=omitempty",
      -- Disable other features you might not need
      dap_debug = false,
      test_runner = 'go', -- can be 'go', 'richgo', 'dlv', 'ginkgo', 'gotestsum'
      run_in_floaterm = false,
      -- Enable only the features you want
      trouble = false,
      luasnip = false,
    })
  end,
}