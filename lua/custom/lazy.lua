local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

local lazy_ui_settings = {
  -- If you have a Nerd Font, set icons to an empty table which will use the
  -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
  icons = vim.g.have_nerd_font and {} or {
    cmd = '⌘',
    config = '🛠',
    event = '📅',
    ft = '📂',
    init = '⚙',
    keys = '🗝',
    plugin = '🔌',
    runtime = '💻',
    require = '🌙',
    source = '📄',
    start = '🚀',
    task = '📌',
    lazy = '💤 ',
  },
}

require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'norcalli/nvim-colorizer.lua',
  require 'custom.plugins',
}, {
  ui = lazy_ui_settings,
  -- luarocks/Lua 5.1 isn't on PATH under NixOS, so lazy's rockspec builds fail
  -- every launch (oxocarbon.nvim et al.) and cascade into "Too many rounds of
  -- missing plugins". Nothing here needs luarocks-installed rocks at runtime:
  -- image.nvim uses the ImageMagick CLI (`processor = "magick_cli"`, build =
  -- false) and the rest are pure-Lua plugins loaded from their git checkouts.
  rocks = { enabled = false },
})

-- avante tokenizer startup as suggested in their docs
-- require('avante_lib').load()