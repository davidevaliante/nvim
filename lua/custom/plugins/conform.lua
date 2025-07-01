-- https://github.com/stevearc/conform.nvim

return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd', stop_after_first = true },
      javascriptreact = { 'prettierd', stop_after_first = true },
      typescript = { 'prettierd', stop_after_first = true },
      typescriptreact = { 'prettierd', stop_after_first = true },
      rust = { "rustfmt", lsp_format = "fallback" },
    },
  },
}
