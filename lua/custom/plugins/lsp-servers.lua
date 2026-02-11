local filter = require('custom.utils').filter
local filterReactDTS = require('custom.utils').filterReactDTS

return {
  lua_ls = require 'custom.plugins.lspservers.lua-ls',
  ts_ls = {
    init_options = {
      preferences = {
        importModuleSpecifierPreference = 'non-relative',
        importModuleSpecifier = 'non-relative',
        importModuleSpecifierEnding = 'minimal',
      },
    },
    handlers = {
      -- this is to avoid double results from node modules with <leader>gd
      ['textDocument/definition'] = function(err, result, method, ...)
        if vim.islist(result) and #result > 1 then
          local filtered_result = filter(result, filterReactDTS)
          return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
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
  -- denols = require 'custom.plugins.lspservers.denols',
}
