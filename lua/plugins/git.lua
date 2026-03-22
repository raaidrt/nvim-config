-- Git: Neogit
vim.pack.add({ { src = "https://github.com/nvim-lua/plenary.nvim" } })
vim.pack.add({ { src = "https://github.com/NeogitOrg/neogit" } })

-- Git: Gitsigns
vim.pack.add({ { src = "https://github.com/lewis6991/gitsigns.nvim" } })
require('gitsigns').setup()

local wk = require('which-key')
wk.add({
  { '<leader>gg', '<Cmd>Neogit<CR>', desc = 'Neogit' },
  { '<leader>gp', '<Cmd>Gitsigns preview_hunk<CR>', desc = 'Preview hunk' },
  { '<leader>gs', '<Cmd>Gitsigns stage_hunk<CR>', desc = 'Stage hunk' },
  { '<leader>gr', '<Cmd>Gitsigns reset_hunk<CR>', desc = 'Reset hunk' },
  { '<leader>gS', '<Cmd>Gitsigns stage_buffer<CR>', desc = 'Stage buffer' },
  { '<leader>gR', '<Cmd>Gitsigns reset_buffer<CR>', desc = 'Reset buffer' },
  { '<leader>gu', '<Cmd>Gitsigns undo_stage_hunk<CR>', desc = 'Undo stage hunk' },
  { '<leader>gb', '<Cmd>Gitsigns blame_line<CR>', desc = 'Blame line' },
  { '<leader>gd', '<Cmd>Gitsigns diffthis<CR>', desc = 'Diff this' },
})
