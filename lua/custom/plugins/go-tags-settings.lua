-- https://github.com/devkvlt/go-tags.nvim
return {
  "devkvlt/go-tags.nvim",
  enabled = false, -- Temporarily disabled due to installation issue
  config = function()
    require('go-tags.nvim').setup({
      commands = {
        ['GoTagsAddJSON'] = { '-add-tags', 'json' },
        ['GoTagsRemoveJSON'] = { '-remove-tags', 'json' },
      },
    })
  end
}
