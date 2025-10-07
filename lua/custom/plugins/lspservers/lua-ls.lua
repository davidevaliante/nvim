return {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = {
          '${3rd}/luv/library',
          unpack(vim.api.nvim_get_runtime_file('', true)),
        },
      },
      completion = {
        callSnippet = 'Replace',
      },
      diagnostics = {
        -- Recognize Neovim globals
        globals = { 'vim' },
        -- Disable specific diagnostics
        disable = {
          'trailing-space',    -- Disables "line with spaces only" warning
          'undefined-global',  -- Disables undefined global warnings (since we defined vim above)
        },
      },
      -- Disable telemetry
      telemetry = {
        enable = false,
      },
      -- Format settings
      format = {
        enable = false,  -- Use stylua or conform for formatting instead
      },
    },
  },
}
