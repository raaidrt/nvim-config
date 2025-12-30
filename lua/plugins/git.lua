-- Git: Neogit
vim.pack.add({ { src = "https://github.com/nvim-lua/plenary.nvim" } })
vim.pack.add({ { src = "https://github.com/NeogitOrg/neogit" } })

local wk = require('which-key')
wk.add({
  { '<leader>gg', '<Cmd>Neogit<CR>', desc = 'Neogit' },
})
