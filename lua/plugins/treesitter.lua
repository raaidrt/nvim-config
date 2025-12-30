-- TreeSitter
vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter" } })

require('nvim-treesitter').setup({
  install_dir = vim.fn.stdpath('data') .. '/site'
})

require('nvim-treesitter').install({ 'wgsl' })

-- Enable treesitter for WGSL files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'wgsl',
  callback = function()
    vim.treesitter.start()
  end,
})
