# 🚀 Neovim Configuration

A robust, modular Neovim configuration built for productivity and maintainability. This setup provides a comprehensive development environment with LSP support, advanced editing features, and a clean plugin architecture.

## 📋 Table of Contents

- [Features](#-features)
- [Plugin Overview](#-plugin-overview)
- [Directory Structure](#-directory-structure)
- [Installation](#-installation)
- [Configuration](#-configuration)
- [Adding New Plugins](#-adding-new-plugins)
- [Adding New Keymaps](#-adding-new-keymaps)
- [Customization](#-customization)
- [Troubleshooting](#-troubleshooting)
- [Plugin Details](#-plugin-details)

## ✨ Features

- **🔌 Plugin Management**: Powered by [lazy.nvim](https://github.com/folke/lazy.nvim)
- **📝 LSP Integration**: Full language server support with completion and diagnostics
- **🔍 Fuzzy Finding**: Advanced file and text search with Telescope
- **🎨 Syntax Highlighting**: Modern syntax highlighting with Treesitter
- **🌳 File Management**: Multiple file explorers (Oil, Neo-tree)
- **📊 Git Integration**: Built-in git operations and diff viewing
- **🖥️ Terminal Integration**: Seamless terminal and shell integration
- **🎯 Navigation**: Smart buffer and project navigation with Grapple
- **💫 UI Enhancements**: Beautiful statusline, trouble diagnostics, and more
- **🛡️ Error Handling**: Robust error handling and fallback systems

## 🔌 Plugin Overview

### Core Editing
- **vim-sleuth**: Automatic indentation detection
- **nvim-autopairs**: Smart bracket and quote pairing
- **nvim-treesitter**: Advanced syntax highlighting and text objects
- **comment.nvim**: Smart commenting with context awareness
- **mini.nvim**: Collection of essential editing utilities

### LSP & Completion
- **nvim-lspconfig**: Language server configuration
- **mason.nvim**: LSP server, formatter, and linter manager
- **nvim-cmp**: Intelligent completion engine
- **conform.nvim**: Code formatting with multiple formatters
- **trouble.nvim**: Pretty diagnostics and quickfix lists

### Navigation & Search
- **telescope.nvim**: Fuzzy finder for files, text, and more
- **oil.nvim**: File manager that feels like a regular buffer
- **neo-tree.nvim**: Traditional file tree explorer
- **flash.nvim**: Enhanced navigation and search motions
- **grapple.nvim**: Project-aware buffer navigation

### Git Integration
- **gitsigns.nvim**: Git decorations and hunk operations
- **lazygit.nvim**: Full-featured git TUI integration
- **diffview.nvim**: Advanced git diff and merge tool

### UI & Visual
- **lualine.nvim**: Customizable statusline
- **fidget.nvim**: LSP progress notifications
- **aerial.nvim**: Code outline and navigation
- **nvim-colorizer.lua**: Color highlighting for hex codes
- **oxocarbon.nvim**: Modern dark theme

### Terminal & Utilities
- **toggleterm.nvim**: Multiple terminal management
- **zen-mode.nvim**: Distraction-free writing mode
- **auto-session**: Automatic session management
- **which-key.nvim**: Keymap help and organization

## 🗂️ Directory Structure

```
~/.config/nvim/
├── init.lua                        # Main entry point
├── README.md                       # This documentation
├── STRUCTURE.md                    # Technical architecture docs
├── lazy-lock.json                  # Plugin version lockfile
│
├── backups/                        # Configuration backups
│   ├── init_old.lua
│   ├── keymaps.lua.old
│   └── lazy.lua.old
│
└── lua/
    ├── core/                       # Future modular systems
    │   ├── loader.lua              # Safe module loading
    │   ├── settings.lua            # Configuration management
    │   ├── keymaps.lua            # Keymap management
    │   └── plugins.lua            # Plugin organization
    │
    ├── keymaps/                    # Modular keymap modules
    │   ├── basic.lua              # Essential editor keymaps
    │   ├── lsp.lua                # LSP and diagnostics
    │   ├── telescope.lua          # File finding and search
    │   ├── navigation.lua         # File managers and navigation
    │   ├── git.lua                # Git operations
    │   └── terminal.lua           # Terminal and utilities
    │
    ├── custom/                     # Current active configuration
    │   ├── options.lua            # Neovim options and settings
    │   ├── autocmds.lua           # Auto commands and events
    │   ├── keymaps.lua            # All key mappings
    │   ├── lazy.lua               # Lazy.nvim setup and configuration
    │   ├── safe_setup.lua         # Safe plugin loading utilities
    │   ├── utils.lua              # Helper functions
    │   │
    │   └── plugins/               # Plugin configurations
    │       ├── init.lua           # Plugin list and organization
    │       ├── lsp-settings.lua   # Language server configuration
    │       ├── cmp-settings.lua   # Completion configuration
    │       ├── telescope_config.lua # Telescope setup
    │       ├── oil-settings.lua   # Oil file manager
    │       ├── gitsigns.lua       # Git integration
    │       ├── lualine.lua        # Statusline configuration
    │       ├── treesitter-settings.lua # Syntax highlighting
    │       └── themes/            # Theme configurations
    │           └── oxocarbon-settings.lua
    │
    └── kickstart/                  # Health check utilities
        └── health.lua             # System health diagnostics
```

## 🚀 Installation

### Prerequisites

Ensure you have the following installed:

```bash
# Neovim (>= 0.9.0)
nvim --version

# Git
git --version

# A Nerd Font (for icons)
# Download from: https://www.nerdfonts.com/

# Required tools
brew install ripgrep fd fzf  # macOS
# or
sudo apt install ripgrep fd-find fzf  # Ubuntu/Debian
```

### Setup

1. **Backup existing configuration:**
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. **Clone this configuration:**
```bash
git clone <your-repo-url> ~/.config/nvim
```

3. **Start Neovim:**
```bash
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

## ⚙️ Configuration

### Basic Settings

Core Neovim settings are in `lua/custom/options.lua`:

```lua
-- Example settings
vim.opt.number = true              -- Show line numbers
vim.opt.relativenumber = true      -- Relative line numbers
vim.opt.tabstop = 2               -- Tab width
vim.opt.shiftwidth = 2            -- Indentation width
vim.opt.expandtab = true          -- Use spaces instead of tabs
```

### Key Mappings

All keymaps are defined in `lua/custom/keymaps.lua`. Key highlights:

#### Leader Key
- **Leader**: `<Space>`

#### Essential Keymaps
- `jj` - Exit insert mode
- `<leader>qq` - Quit Neovim
- `<C-s>` - Save file
- `<Esc>` - Clear search highlighting

#### File Navigation
- `<C-n>` - Open Oil file manager
- `<C-t>` - Toggle Neo-tree
- `<leader>ff` - Find files (Telescope)
- `<leader>gg` - Live grep (Telescope)
- `<leader>fz` - Fuzzy find in current buffer

#### LSP & Diagnostics
- `<leader>gd` - Go to definition
- `<leader>gi` - Go to implementation
- `[d` / `]d` - Previous/next diagnostic
- `<leader>e` - Show diagnostic in float
- `<leader>xx` - Open Trouble diagnostics

#### Git Operations
- `<leader>lg` - Open LazyGit
- `<leader>dw` - Open Diffview
- `<leader>hs` - Stage git hunk
- `<leader>hr` - Reset git hunk

#### Terminal
- `<C-\>` - Toggle terminal (tab)
- `<C-p>` - Toggle floating terminal

#### Buffer Navigation
- `<Tab>` / `<S-Tab>` - Next/previous buffer (or Grapple tags)
- `<C-d><C-d>` - Delete current buffer

## 🔌 Adding New Plugins

### Method 1: Direct Addition to Plugin List

Add to `lua/custom/plugins/init.lua`:

```lua
return {
  -- ... existing plugins ...
  
  -- Add your new plugin here
  {
    "author/plugin-name.nvim",
    event = "VeryLazy",  -- Load timing
    config = function()
      require("plugin-name").setup({
        -- Plugin configuration
        option1 = "value1",
        option2 = true,
      })
    end,
    dependencies = {  -- Optional dependencies
      "dependency/plugin.nvim"
    }
  },
}
```

### Method 2: Separate Configuration File

1. **Create a new file**: `lua/custom/plugins/my-plugin-settings.lua`

```lua
-- lua/custom/plugins/my-plugin-settings.lua
return {
  "author/my-plugin.nvim",
  event = "BufReadPre",
  config = function()
    local safe_setup = require('custom.safe_setup')
    safe_setup.setup('my-plugin', {
      -- Configuration options
      enable_feature = true,
      custom_option = "value",
    })
  end,
  keys = {
    { "<leader>mp", "<cmd>MyPlugin<cr>", desc = "Open My Plugin" },
  },
}
```

2. **Add to plugin list** in `lua/custom/plugins/init.lua`:

```lua
return {
  -- ... existing plugins ...
  require 'custom.plugins.my-plugin-settings',
}
```

### Plugin Configuration Examples

#### Simple Plugin
```lua
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({})
  end,
}
```

#### Plugin with Dependencies
```lua
{
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
      },
    })
  end,
}
```

#### Plugin with Custom Keys
```lua
{
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ha", function() require("harpoon.mark").add_file() end, desc = "Add file to harpoon" },
    { "<leader>hm", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle harpoon menu" },
  },
  config = function()
    require("harpoon").setup()
  end,
}
```

## ⌨️ Adding New Keymaps

### Adding to Existing Keymap File

Edit `lua/custom/keymaps.lua`:

```lua
-- Add at the end of the file, before the return statement

-- Custom keymaps section
vim.keymap.set('n', '<leader>my', ':MyCommand<CR>', { desc = 'My custom command' })
vim.keymap.set('n', '<leader>fn', function()
  print("Custom function keymap")
end, { desc = 'Custom function' })

-- Visual mode keymap
vim.keymap.set('v', '<leader>sort', ':sort<CR>', { desc = 'Sort selected lines' })

-- Insert mode keymap
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move cursor right' })
```

### Plugin-Specific Keymaps

For plugin-specific keymaps, add them in the plugin's configuration:

```lua
-- In lua/custom/plugins/my-plugin-settings.lua
return {
  "author/my-plugin.nvim",
  keys = {
    { "<leader>mp", "<cmd>MyPluginToggle<cr>", desc = "Toggle My Plugin" },
    { "<leader>ms", function() require("my-plugin").search() end, desc = "My Plugin Search" },
    { "<leader>mc", "<cmd>MyPluginConfig<cr>", desc = "Configure My Plugin", mode = "n" },
  },
  config = function()
    -- Plugin setup
  end,
}
```

### LSP-Specific Keymaps

Add LSP keymaps in the `LspAttach` autocmd in `lua/custom/autocmds.lua`:

```lua
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Add your custom LSP keymaps here
    map('<leader>cr', vim.lsp.buf.rename, '[C]ode [R]ename')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('<leader>cf', vim.lsp.buf.format, '[C]ode [F]ormat')
  end,
})
```

### Keymap Best Practices

1. **Use descriptive names** for keymap descriptions
2. **Group related keymaps** with common prefixes (e.g., `<leader>g` for git)
3. **Use silent = true** for most keymaps to avoid command line noise
4. **Check for conflicts** before adding new keymaps
5. **Use buffer-local keymaps** for plugin-specific functionality

### Keymap Reference

| Mode | Description | Example |
|------|-------------|---------|
| `n` | Normal mode | `vim.keymap.set('n', 'key', 'action')` |
| `i` | Insert mode | `vim.keymap.set('i', 'key', 'action')` |
| `v` | Visual mode | `vim.keymap.set('v', 'key', 'action')` |
| `t` | Terminal mode | `vim.keymap.set('t', 'key', 'action')` |
| `c` | Command mode | `vim.keymap.set('c', 'key', 'action')` |

## 🎨 Customization

### Changing Theme

1. **Install a new theme plugin** in `lua/custom/plugins/init.lua`:

```lua
{
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
```

2. **Or use an existing theme** from `lua/custom/plugins/themes/`:

Edit `lua/custom/plugins/init.lua` and uncomment your preferred theme:

```lua
-- require 'custom.plugins.themes.catppuccin-settings',
require 'custom.plugins.themes.oxocarbon-settings',  -- Current
-- require 'custom.plugins.themes.tokyonight-settings',
```

### Customizing LSP Servers

Edit `lua/custom/plugins/lsp-settings.lua`:

```lua
-- Add new language servers
local servers = {
  lua_ls = {},
  rust_analyzer = {},
  tsserver = {},
  -- Add your language server here
  pyright = {  -- Python
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
        },
      },
    },
  },
}
```

### Customizing Statusline

Edit `lua/custom/plugins/lualine.lua`:

```lua
require('lualine').setup({
  options = {
    theme = 'oxocarbon',  -- Change theme
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    -- Customize sections
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
})
```

### Adding Auto Commands

Edit `lua/custom/autocmds.lua`:

```lua
-- Auto-save on focus lost
vim.api.nvim_create_autocmd('FocusLost', {
  pattern = '*',
  command = 'silent! wa',
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
  end,
})

-- Auto-format on save for specific filetypes
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.lua', '*.js', '*.ts', '*.py' },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
```

## 🔧 Troubleshooting

### Common Issues

#### Plugin Not Loading
1. Check plugin name and repository URL
2. Verify lazy.nvim configuration syntax
3. Look for error messages in `:messages`
4. Try `:Lazy sync` to update plugins

#### LSP Not Working
1. Check if language server is installed: `:Mason`
2. Verify LSP is attached: `:LspInfo`
3. Check for errors in `:messages`
4. Restart LSP: `:LspRestart`

#### Keymaps Not Working
1. Check for keymap conflicts: `:verbose map <key>`
2. Verify plugin is loaded
3. Check syntax in keymap definition

#### Performance Issues
1. Check startup time: `nvim --startuptime startup.log`
2. Profile plugins with `:Lazy profile`
3. Disable unnecessary plugins
4. Use lazy loading (`event`, `cmd`, `keys`)

### Health Checks

Run health checks to diagnose issues:

```vim
:checkhealth
:checkhealth telescope
:checkhealth mason
:checkhealth lsp
```

### Useful Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Open plugin manager |
| `:Mason` | Open LSP/tool installer |
| `:Telescope` | Open Telescope |
| `:LspInfo` | Show LSP information |
| `:messages` | Show Neovim messages |
| `:checkhealth` | Run health checks |

## 📚 Plugin Details

### 🎯 Navigation Plugins

#### Telescope
**Purpose**: Fuzzy finder for files, text, symbols, and more.
**Key Features**:
- File finding with preview
- Live grep across project
- Git integration
- Extensible with many extensions

**Key Keymaps**:
- `<leader>ff` - Find files
- `<leader>gg` - Live grep
- `<leader>fz` - Current buffer fuzzy find

#### Oil.nvim
**Purpose**: Edit your filesystem like a normal Neovim buffer.
**Key Features**:
- Edit directories as buffers
- File operations with normal Vim commands
- Seamless integration with other tools

**Key Keymaps**:
- `<C-n>` - Open Oil
- `-` - Go to parent directory (in Oil)
- `<CR>` - Enter directory/open file

#### Grapple
**Purpose**: Project-aware buffer navigation and bookmarking.
**Key Features**:
- Tag important files in projects
- Quick navigation between tagged files
- Persistent tags across sessions

**Key Keymaps**:
- `<C-m><C-m>` - Toggle grapple mark
- `<Tab>` / `<S-Tab>` - Cycle through grapple tags
- `<A-1>` to `<A-9>` - Jump to specific grapple index

### 🔧 LSP & Development

#### LSP Configuration
**Purpose**: Full language server support.
**Included Servers**:
- `lua_ls` - Lua
- `tsserver` - TypeScript/JavaScript
- `gopls` - Go
- `rust_analyzer` - Rust
- `pyright` - Python

#### Mason.nvim
**Purpose**: Manage external tools (LSP servers, formatters, linters).
**Features**:
- Easy installation of development tools
- Automatic updates
- Cross-platform support

#### nvim-cmp
**Purpose**: Completion engine with multiple sources.
**Sources**:
- LSP completion
- Buffer text
- File paths
- Snippets

#### Conform.nvim
**Purpose**: Code formatting with multiple formatters.
**Included Formatters**:
- `stylua` - Lua
- `prettier` - JavaScript/TypeScript/CSS/HTML
- `black` - Python
- `gofmt` - Go

### 🎨 UI & Visual

#### Lualine
**Purpose**: Fast and customizable statusline.
**Features**:
- Git branch and diff info
- LSP diagnostics
- File information
- Multiple themes

#### Trouble
**Purpose**: Pretty diagnostics and quickfix lists.
**Features**:
- Better diagnostic display
- Quickfix integration
- File preview

#### Treesitter
**Purpose**: Modern syntax highlighting and text objects.
**Features**:
- Accurate syntax highlighting
- Smart text objects
- Code folding
- Incremental selection

### 🌐 Git Integration

#### GitSigns
**Purpose**: Git decorations and hunk operations.
**Features**:
- Show git changes in sign column
- Hunk navigation and staging
- Blame information
- Diff preview

#### LazyGit
**Purpose**: Full-featured git TUI integration.
**Features**:
- Complete git workflow
- Visual diff and merge
- Branch management
- Commit history

#### Diffview
**Purpose**: Advanced git diff and merge tool.
**Features**:
- Side-by-side diffs
- File history
- Merge conflict resolution

### 🖥️ Terminal & Utilities

#### ToggleTerm
**Purpose**: Multiple terminal management.
**Features**:
- Floating terminals
- Multiple terminal instances
- Integration with external tools

#### Zen Mode
**Purpose**: Distraction-free writing environment.
**Features**:
- Hide UI elements
- Center content
- Adjustable width

#### Auto-session
**Purpose**: Automatic session management.
**Features**:
- Save and restore sessions
- Per-directory sessions
- Integration with file explorers

## 🚀 Advanced Usage

### Custom Commands

You can add custom commands in your configuration:

```lua
-- In lua/custom/autocmds.lua or init.lua
vim.api.nvim_create_user_command('ReloadConfig', function()
  for name, _ in pairs(package.loaded) do
    if name:match("^custom") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  vim.notify("Configuration reloaded!")
end, {})
```

### Plugin Development

To create your own plugins:

1. Create a directory in `lua/custom/plugins/`
2. Follow Neovim plugin conventions
3. Use the modular architecture for organization

### Performance Optimization

1. **Use lazy loading**: Configure plugins to load only when needed
2. **Profile startup**: Use `:Lazy profile` to identify slow plugins
3. **Disable unused features**: Turn off features you don't use
4. **Use faster alternatives**: Consider faster alternatives for heavy plugins

---

## 📄 License

This configuration is provided as-is for educational and personal use. Individual plugins have their own licenses.

## 🤝 Contributing

Feel free to:
- Report issues
- Suggest improvements
- Submit pull requests
- Share your customizations

## 📞 Support

If you encounter issues:
1. Check this README first
2. Run `:checkhealth` for diagnostics
3. Look at `:messages` for error details
4. Check individual plugin documentation
5. Search existing issues

---

**Happy Vimming!** 🎉