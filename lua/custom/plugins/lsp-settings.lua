-- https://github.com/neovim/nvim-lspconfig
return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    require('mason').setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local servers = require 'custom.plugins.lsp-servers'
    local ensure_installed = vim.tbl_keys(servers or {})

    require('mason-tool-installer').setup { ensure_installed = vim.tbl_keys(servers or {}) }

    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format lua code
    })

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
