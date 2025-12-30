-- Statusline: Lualine
vim.pack.add({ { src = "https://github.com/nvim-tree/nvim-web-devicons" } })
vim.pack.add({ { src = "https://github.com/nvim-lualine/lualine.nvim" } })

require('lualine').setup({
  options = {
    theme = 'everforest',
    section_separators = '',
    component_separators = '|'
  }
})
