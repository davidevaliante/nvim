-- Robust plugin management system integrated with lazy.nvim
local M = {}
local loader = require('core.loader')
local settings = require('core.settings')

-- Plugin categories for better organization
M.categories = {
  core = {},
  lsp = {},
  ui = {},
  editor = {},
  git = {},
  navigation = {},
  terminal = {},
  themes = {},
}

-- Register a plugin in a category
function M.register(category, plugin_spec)
  if not M.categories[category] then
    vim.notify(string.format("Unknown plugin category: %s", category), vim.log.levels.WARN)
    M.categories[category] = {}
  end
  
  -- Add enabled check if not present
  if plugin_spec.enabled == nil then
    local plugin_name = plugin_spec[1] or plugin_spec.name
    if plugin_name then
      -- Extract plugin name from github url if needed
      local name = plugin_name:match("([^/]+)$") or plugin_name
      name = name:gsub("%.nvim$", ""):gsub("%.vim$", ""):gsub("^nvim%-", "")
      plugin_spec.enabled = function()
        return settings.is_plugin_enabled(name)
      end
    end
  end
  
  table.insert(M.categories[category], plugin_spec)
end

-- Get all plugins from enabled categories
function M.get_all_plugins()
  local all_plugins = {}
  
  for category, plugins in pairs(M.categories) do
    if settings.get("plugins.enable_" .. category) ~= false then
      for _, plugin in ipairs(plugins) do
        table.insert(all_plugins, plugin)
      end
    end
  end
  
  return all_plugins
end

-- Setup lazy.nvim with error handling
function M.setup_lazy()
  -- Ensure lazy.nvim is installed
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.notify("Installing lazy.nvim...", vim.log.levels.INFO)
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
  
  -- Load lazy.nvim
  local lazy = loader.safe_require("lazy", { required = true })
  if not lazy then
    vim.notify("Failed to load lazy.nvim!", vim.log.levels.ERROR)
    return false
  end
  
  -- Basic plugins that should always be available
  local basic_plugins = {
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    "norcalli/nvim-colorizer.lua", -- Color highlighter
  }
  
  -- Get all registered plugins
  local all_plugins = M.get_all_plugins()
  
  -- Combine basic and registered plugins
  local final_plugins = vim.list_extend(basic_plugins, all_plugins)
  
  -- UI configuration for lazy
  local ui_config = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  }
  
  -- Setup lazy with error handling
  local success, error_msg = pcall(lazy.setup, final_plugins, {
    ui = ui_config,
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "matchit",
          "matchparen",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
    checker = {
      enabled = true,
      frequency = 3600, -- Check for updates every hour
    },
  })
  
  if not success then
    vim.notify(string.format("Failed to setup lazy.nvim: %s", error_msg), vim.log.levels.ERROR)
    return false
  end
  
  return true
end

-- Health check for plugins
function M.health_check()
  local report = {
    enabled_plugins = 0,
    disabled_plugins = 0,
    failed_plugins = {},
    categories = {},
  }
  
  for category, plugins in pairs(M.categories) do
    local category_report = {
      total = #plugins,
      enabled = 0,
      disabled = 0,
    }
    
    for _, plugin in ipairs(plugins) do
      local plugin_name = plugin[1] or plugin.name or "unknown"
      
      if type(plugin.enabled) == "function" then
        if plugin.enabled() then
          category_report.enabled = category_report.enabled + 1
          report.enabled_plugins = report.enabled_plugins + 1
        else
          category_report.disabled = category_report.disabled + 1
          report.disabled_plugins = report.disabled_plugins + 1
        end
      else
        category_report.enabled = category_report.enabled + 1
        report.enabled_plugins = report.enabled_plugins + 1
      end
    end
    
    report.categories[category] = category_report
  end
  
  return report
end

-- Print health report
function M.print_health()
  local health = M.health_check()
  
  print("=== Plugin Health Report ===")
  print(string.format("Enabled plugins: %d", health.enabled_plugins))
  print(string.format("Disabled plugins: %d", health.disabled_plugins))
  print()
  
  print("By category:")
  for category, report in pairs(health.categories) do
    print(string.format("  %s: %d/%d enabled", category, report.enabled, report.total))
  end
  
  if #health.failed_plugins > 0 then
    print()
    print("Failed plugins:")
    for _, plugin in ipairs(health.failed_plugins) do
      print(string.format("  - %s", plugin))
    end
  end
end

return M