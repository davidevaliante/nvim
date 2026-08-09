-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  -- Highlight, edit, and navigate code.
  'nvim-treesitter/nvim-treesitter',
  -- Use the `main` branch: it's the actively-maintained rewrite that targets
  -- Neovim 0.12+. The old `master` branch is frozen and its query directive
  -- handlers (e.g. markdown injection directives) crash on 0.12's list-based
  -- match API with `attempt to call method 'range' (a nil value)`.
  branch = 'main',
  -- `main` does not support lazy-loading; load it at startup.
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require 'nvim-treesitter'

    ts.setup {}

    -- Parsers to always keep installed. Unlike `master`, `main` installs into
    -- stdpath('data')/site (not the plugin dir), so run `:TSUpdate` once after
    -- switching branches to (re)build these. `install` is async + idempotent.
    local ensure_installed = {
      'bash',
      'c',
      'html',
      'lua',
      'markdown',
      'markdown_inline',
      'vim',
      'vimdoc',
      'rust',
    }
    ts.install(ensure_installed)

    -- `main` no longer auto-enables features; highlighting, indentation and
    -- folding are opt-in per buffer via Neovim's core treesitter. This autocmd
    -- turns them on for any filetype with an available parser, and lazily
    -- installs a missing parser first (replaces `master`'s `auto_install`).
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('user_treesitter', { clear = true }),
      callback = function(args)
        local buf = args.buf
        local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
        if not lang or not vim.tbl_contains(ts.get_available(), lang) then
          return
        end

        local function enable()
          if not vim.api.nvim_buf_is_valid(buf) then
            return
          end
          pcall(vim.treesitter.start, buf, lang)
          -- Treesitter-based indentation (experimental upstream).
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end

        if vim.tbl_contains(ts.get_installed(), lang) then
          enable()
        else
          ts.install({ lang }):await(function(err)
            if not err then
              vim.schedule(enable)
            end
          end)
        end
      end,
    })

    -- Incremental selection by treesitter node. `master`'s
    -- `incremental_selection` module isn't provided by `main` and Neovim core
    -- has no built-in equivalent, so this is a compact native reimplementation
    -- of the original mappings:
    --   gnn - start selection at the node under the cursor (normal mode)
    --   grn - expand selection to the parent node (visual mode)
    --   grm - shrink to the previously selected node (visual mode)
    local selection = {}

    local function range_of(node)
      local sr, sc, er, ec = node:range()
      return { sr, sc, er, ec }
    end

    local function visually_select(node)
      local sr, sc, er, ec = node:range()
      if ec == 0 then
        -- range end is exclusive; a 0 end-column means the node ends at the
        -- start of `er`, so the last selected char is the end of the line above.
        er = er - 1
        ec = vim.v.maxcol
      end
      vim.fn.setpos("'<", { 0, sr + 1, sc + 1, 0 })
      vim.fn.setpos("'>", { 0, er + 1, ec, 0 })
      vim.cmd 'normal! gv'
    end

    local function init_selection()
      local buf = vim.api.nvim_get_current_buf()
      local node = vim.treesitter.get_node()
      if not node then
        return
      end
      selection[buf] = { node }
      visually_select(node)
    end

    local function node_incremental()
      local buf = vim.api.nvim_get_current_buf()
      local stack = selection[buf]
      if not stack or #stack == 0 then
        return init_selection()
      end
      local node = stack[#stack]
      local parent = node:parent()
      -- climb until a parent actually enlarges the selected range
      while parent and vim.deep_equal(range_of(parent), range_of(node)) do
        parent = parent:parent()
      end
      if parent then
        table.insert(stack, parent)
        node = parent
      end
      visually_select(node)
    end

    local function node_decremental()
      local buf = vim.api.nvim_get_current_buf()
      local stack = selection[buf]
      if not stack or #stack <= 1 then
        return
      end
      table.remove(stack)
      visually_select(stack[#stack])
    end

    vim.keymap.set('n', 'gnn', init_selection, { desc = 'TS: init selection' })
    vim.keymap.set('x', 'grn', node_incremental, { desc = 'TS: expand to parent node' })
    vim.keymap.set('x', 'grm', node_decremental, { desc = 'TS: shrink node selection' })
  end,
}
