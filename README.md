## External dependencies:
- ripgrep -> (Telescope) -> https://github.com/BurntSushi/ripgrep
- gcc -> (kickstart) -> https://gcc.gnu.org
- Nerd Font (Terminal/Nvim) -> https://www.nerdfonts.com

## Plugin manager:
Lazy -> https://github.com/folke/lazy.nvim

## Plugin Installed through Lazy:
- Comment -> https://github.com/numToStr/Comment.nvim
- Gitsigns -> https://github.com/lewis6991/gitsigns.nvim
- WhichKey -> https://github.com/folke/which-key.nvim
- Telescope -> https://github.com/nvim-telescope/telescope.nvim
- LspConfig -> https://github.com/neovim/nvim-lspconfig
    with dependencies: (mason, mason-tool-installer, mason-lsp)
- Conform -> (formatting) https://github.com/stevearc/conform.nvim
- Cmp -> https://github.com/hrsh7th/nvim-cmp
- Autopairs -> https://github.com/windwp/nvim-autopairs (configured with Cmp)
- Lspkind -> https://github.com/onsails/lspkind.nvim
- Todo-Comments (pretty-comments) -> https://github.com/folke/todo-comments.nvim
- Treesitter -> https://github.com/nvim-treesitter/nvim-treesitter
    with module incremental selection
- Flash https://github.com/folke/flash.nvim
- Oil https://github.com/stevearc/oil.nvim

## Configured language servers:
- lua-ls -> https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
- denols -> https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols

## Configured formatters by filetype:
NOTE: these needs to be installed via mason or external sources
- ts, js, tsx, jsx : prettierd/prettier
- lua : stylua
