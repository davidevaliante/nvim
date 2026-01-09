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

    -- Servers not managed by Mason (built into external tools)
    local non_mason_servers = { 'gdscript' }
    local ensure_installed = vim.tbl_filter(function(server)
      return not vim.tbl_contains(non_mason_servers, server)
    end, vim.tbl_keys(servers or {}))

    safe_setup.setup('mason-tool-installer', { ensure_installed = ensure_installed })

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

    -- Setup non-Mason servers manually
    local ok_lsp, lspconfig = pcall(require, 'lspconfig')
    if ok_lsp then
      for _, server_name in ipairs(non_mason_servers) do
        local server = servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        if lspconfig[server_name] then
          lspconfig[server_name].setup(server)
        end
      end
    end
  end,
}
