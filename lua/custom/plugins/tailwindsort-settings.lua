-- https://github.com/laytan/tailwind-sorter.nvim

return {
  'laytan/tailwind-sorter.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
  build = 'cd formatter && npm ci && npm run build',
  config = true,
  opts = {
    on_save_pattern = { '*.html', '*.jsx', '*.tsx' },
    on_save_enabled = true,
  },
}
