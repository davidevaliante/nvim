return {
  lua_ls = require 'custom.plugins.lspservers.lua-ls',
  tsserver = {
    init_options = {
      preferences = {
        importModuleSpecifierPreference = 'non-relative',
        importModuleSpecifierEnding = 'minimal',
      },
    },
  },
  -- denols = require 'custom.plugins.lspservers.denols',
}
