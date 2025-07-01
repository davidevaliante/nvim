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
    local safe_setup = require('custom.safe_setup')
    
    safe_setup.setup('mason', {})

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local servers = require 'custom.plugins.lsp-servers'
    local ensure_installed = vim.tbl_keys(servers or {})

    safe_setup.setup('mason-tool-installer', { ensure_installed = vim.tbl_keys(servers or {}) })

    local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if ok and cmp_nvim_lsp.default_capabilities then
      capabilities = vim.tbl_deep_extend('force', capabilities, cmp_nvim_lsp.default_capabilities())
    end

    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format lua code
    })

    safe_setup.setup('mason-lspconfig', {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          local ok_lsp, lspconfig = pcall(require, 'lspconfig')
          if ok_lsp and type(lspconfig) == 'table' and lspconfig[server_name] then
            lspconfig[server_name].setup(server)
          end
        end,
      },
    })
  end,
}
