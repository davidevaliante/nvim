## External dependencies:
- ripgrep (Telescope)
- gcc (kickstart)
- Nerd Font

## Plugin manager:
Lazy -> https://github.com/folke/lazy.nvim

## Plugin Installed through Lazy:
- Comment https://github.com/numToStr/Comment.nvim
- Gitsigns https://github.com/lewis6991/gitsigns.nvim
- WhichKey https://github.com/folke/which-key.nvim
- Telescope https://github.com/nvim-telescope/telescope.nvim
- LspConfig https://github.com/neovim/nvim-lspconfig
    with dependencies: (mason, mason-tool-installer, mason-lsp)
- Conform (formatting)


## Configured language servers:
- lua-ls
- denols

## Configured formatters by filetype:
NOTE: these needs to be installed via mason or external sources
- ts, js, tsx, jsx : prettierd/prettier
- lua : stylua