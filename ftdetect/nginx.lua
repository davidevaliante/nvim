vim.filetype.add({
  pattern = {
    ['nginx%.conf%.%w+'] = 'nginx',
    ['%.nginx'] = 'nginx',
  },
})
