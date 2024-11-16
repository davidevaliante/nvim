## External dependencies:
- ripgrep -> (Telescope) -> https://github.com/BurntSushi/ripgrep
- gcc -> (kickstart) -> https://gcc.gnu.org
- Nerd Font (Terminal/Nvim) -> https://www.nerdfonts.com

## Theme
- cattpuccin https://github.com/catppuccin/nvim
- tokyonight https://github.com/folke/tokyonight.nvim (current)

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
- Toggleterm https://github.com/akinsho/toggleterm.nvim
- Lazygit https://github.com/kdheepak/lazygit.nvim https://github.com/jesseduffield/lazygit
- Colorizer https://github.com/norcalli/nvim-colorizer.lua
- Zenmode https://github.com/folke/zen-mode.nvim
- AutoTag https://github.com/windwp/nvim-ts-autotag
- TailwindSort https://github.com/laytan/tailwind-sorter.nvim
- Copilot https://github.com/zbirenbaum/copilot.lua
- CopilotCmp (disabled) https://github.com/zbirenbaum/copilot-cmp?ref=tamerlan.dev
- ChatGPT https://github.com/jackMort/ChatGPT.nvim (see dependencies)
- Cybu https://github.com/ghillb/cybu.nvim
- Added autosession https://github.com/rmagatti/auto-session
- friendly-snippets https://github.com/rafamadriz/friendly-snippets
- diffview https://github.com/sindrets/diffview.nvim
- Trouble https://github.com/folke/trouble.nvim
- Fidget https://github.com/j-hui/fidget.nvim
- Grapple https://github.com/cbochs/grapple.nvim

## Dependencies
- ChatGPT requires a key.txt.gpg file in ~

## Configured language servers:
- lua-ls -> https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
- denols (not properly configured for path aliases) -> https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols
- tsserver -> https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
- tailwind -> https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss
- emmet -> https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#emmet_language_server 
- golang -> https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls


## Configured formatters by filetype:
NOTE: these needs to be installed via mason or external sources
- ts, js, tsx, jsx : [prettierd/prettier, tailwindformatter]
- lua : stylua

