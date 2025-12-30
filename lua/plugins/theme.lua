-- Everforest Theme
vim.pack.add({ { src = "https://github.com/neanias/everforest-nvim" } })

require('everforest').setup({
  background = "hard"
})

vim.cmd([[colorscheme everforest]])
