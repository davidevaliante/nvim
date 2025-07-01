# Modular Neovim Configuration Structure

This configuration is built with modularity, robustness, and maintainability in mind.

## Directory Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point (modular system)
├── init_old.lua               # Backup of original init.lua
├── STRUCTURE.md               # This documentation
│
├── lua/
│   ├── core/                  # Core systems
│   │   ├── loader.lua         # Safe module loading with error handling
│   │   ├── settings.lua       # Centralized configuration management
│   │   ├── keymaps.lua        # Keymap management system
│   │   └── plugins.lua        # Plugin categorization and management
│   │
│   ├── keymaps/               # Modular keymaps by functionality
│   │   ├── basic.lua          # Essential editor keymaps
│   │   ├── lsp.lua            # LSP and diagnostics
│   │   ├── telescope.lua      # File finding and search
│   │   ├── navigation.lua     # File managers and navigation
│   │   ├── git.lua            # Git operations
│   │   └── terminal.lua       # Terminal and utilities
│   │
│   ├── custom/                # Legacy configuration (gradually being replaced)
│   │   ├── options.lua        # Vim options
│   │   ├── autocmds.lua       # Auto commands
│   │   ├── safe_setup.lua     # Legacy safe setup (now uses core.loader)
│   │   ├── utils.lua          # Utility functions
│   │   └── plugins/           # Plugin configurations
│   │       ├── init.lua       # Plugin list (legacy)
│   │       ├── lsp-settings.lua
│   │       ├── telescope_config.lua
│   │       └── ...            # Individual plugin configs
│   │
│   └── kickstart/             # Health check utilities
│       └── health.lua         # System health checks
```

## Core Systems

### 1. **core/loader.lua** - Safe Module Loading
- Robust error handling for all module loading
- Fallback support for missing dependencies
- Comprehensive logging and error reporting
- Safe function execution with context

### 2. **core/settings.lua** - Configuration Management
- Centralized settings with defaults
- Deep merge for user customization
- Validation and type checking
- Runtime setting changes with immediate effect

### 3. **core/keymaps.lua** - Keymap Management
- Modular keymap registration system
- Plugin-dependent keymaps with fallbacks
- Conditional mapping based on availability
- Easy keymap clearing and reloading

### 4. **core/plugins.lua** - Plugin Organization
- Plugin categorization (core, lsp, ui, navigation, etc.)
- Automatic enabled/disabled checking
- Health monitoring and reporting
- Integration with lazy.nvim

## Key Features

### ✅ **Error Resistance**
Every module loads safely with comprehensive error handling. Missing plugins or modules won't break the entire configuration.

### ✅ **Smart Fallbacks**
Keymaps automatically fall back to built-in alternatives when plugins aren't available.

### ✅ **Easy Customization**
Edit the `user_config` section in `init.lua` to customize:
- Theme and UI settings
- Editor behavior
- Plugin preferences
- Keybinding preferences

### ✅ **Health Monitoring**
Built-in commands to monitor configuration health:
- `:ConfigHealth` - Check plugin status and configuration validity
- `:ConfigReload` - Hot reload configuration without restarting

### ✅ **Modular Keymaps**
Keymaps are organized by functionality:
- **basic.lua** - Essential editing (save, quit, navigation)
- **lsp.lua** - Language server and diagnostics
- **telescope.lua** - File finding and search
- **navigation.lua** - File managers and buffer navigation
- **git.lua** - Git operations
- **terminal.lua** - Terminal and utility tools

## Usage

### Configuration
Edit the `user_config` table in `init.lua`:

```lua
local user_config = {
  ui = {
    theme = "oxocarbon",        -- Change theme
    transparency = false,       -- Enable transparency
  },
  editor = {
    tab_size = 2,              -- Indentation size
    auto_save = false,         -- Auto-save files
  },
  plugins = {
    disabled_plugins = { "avante" }, -- Disable specific plugins
  },
  keybinds = {
    leader_key = " ",          -- Leader key
    escape_sequence = "jj",    -- Insert mode escape
  },
}
```

### Management Commands
- `:ConfigHealth` - Check system health
- `:ConfigReload` - Reload configuration
- `:Lazy` - Manage plugins

### Adding New Keymaps
Create a new file in `keymaps/` and register it in `init.lua`:

```lua
-- In keymaps/my_module.lua
return function(km)
  km.nmap('<leader>x', ':echo "Hello"<CR>', { desc = 'Say hello' })
end

-- In init.lua
keymap_manager.register_module("my_module", require('keymaps.my_module'))
```

### Adding New Plugins
Register plugins by category in the `register_plugins()` function:

```lua
plugin_manager.register("ui", {
  "my-author/my-plugin.nvim",
  config = function()
    require("my-plugin").setup({})
  end
})
```

## Migration from Legacy Config

The legacy configuration in `custom/` is still functional and gradually being migrated to the new modular system. Both systems coexist during the transition.

## Benefits

1. **Maintainable** - Clear separation of concerns
2. **Robust** - Comprehensive error handling
3. **Flexible** - Easy to customize and extend
4. **Debuggable** - Built-in health monitoring
5. **Future-proof** - Modular architecture scales well

## Troubleshooting

If you encounter issues:
1. Run `:ConfigHealth` to check system status
2. Check error messages in `:messages`
3. Try `:ConfigReload` to reload configuration
4. Fall back to `init_old.lua` if needed