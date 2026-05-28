local filter = require('custom.utils').filter
local filterReactDTS = require('custom.utils').filterReactDTS

return {
  lua_ls = require 'custom.plugins.lspservers.lua-ls',
  ts_ls = {
    init_options = {
      preferences = {
        importModuleSpecifierPreference = 'relative',
        importModuleSpecifier = 'relative',
        importModuleSpecifierEnding = 'minimal',
      },
    },
    handlers = {
      -- filter out React DTS duplicates and jump directly to the first result
      ['textDocument/definition'] = function(err, result, method, ...)
        if vim.islist(result) and #result > 1 then
          local filtered_result = filter(result, filterReactDTS)
          result = #filtered_result > 0 and filtered_result or result
        end

        if vim.islist(result) and #result > 1 then
          result = { result[1] }
        end

        vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
      end,
    },
  },
  gopls = require 'custom.plugins.lspservers.gopls',
  nginx_language_server = {},
  html = {},
  cssls = {},
  gdscript = {},
  nixd = require 'custom.plugins.lspservers.nixd',
  -- denols = require 'custom.plugins.lspservers.denols',
}
