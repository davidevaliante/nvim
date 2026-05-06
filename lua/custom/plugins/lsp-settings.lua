-- https://github.com/neovim/nvim-lspconfig
--
-- Mason removed: LSP/formatter binaries are provided by nix at the system
-- level (see ~/nixos-config/modules/home/programs/neovim.nix). nvim-lspconfig
-- finds them automatically via $PATH. To add a new server: declare its
-- package in neovim.nix, add it to lsp-servers.lua, rebuild.

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local servers = require 'custom.plugins.lsp-servers'

    local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if ok and cmp_nvim_lsp.default_capabilities then
      capabilities = vim.tbl_deep_extend('force', capabilities, cmp_nvim_lsp.default_capabilities())
    end

    for server_name, server in pairs(servers) do
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      vim.lsp.config(server_name, server)
      vim.lsp.enable(server_name)
    end
  end,
}
