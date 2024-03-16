return {
  lua_ls = require 'custom.plugins.lspservers.lua-ls',
  tsserver = require('lspconfig').tsserver.setup {},
  -- denols = require 'custom.plugins.lspservers.denols',
}
