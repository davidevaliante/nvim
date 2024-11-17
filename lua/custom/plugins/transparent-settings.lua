-- https://github.com/xiyaowong/transparent.nvim
return {
  'xiyaowong/transparent.nvim',
  config = function()
    vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "Comment" })
  end
}
