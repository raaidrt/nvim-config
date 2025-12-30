-- Navigation: Oil, Snacks Picker, Neo-tree

-- Oil file editor
vim.pack.add({ { src = 'https://github.com/stevearc/oil.nvim' } })
require('oil').setup()

-- Snacks picker
vim.pack.add({ { src = 'https://github.com/folke/snacks.nvim' } })
local Snacks = require('snacks')
Snacks.setup({
  picker = {
    layout = {
      preset = "ivy",
    },
  },
})

-- Search keybindings (<leader>s)
local wk = require('which-key')
wk.add({
  { '<leader>sf', function() Snacks.picker.files() end, desc = 'Search files' },
  { '<leader>sg', function() Snacks.picker.grep() end, desc = 'Search grep' },
  { '<leader>sh', function() Snacks.picker.help() end, desc = 'Search help' },
})

-- Tab new with file picker
wk.add({
  { '<leader>tn', function()
    vim.cmd('tabnew')
    Snacks.picker.files()
  end, desc = 'New tab + files' },
})

-- Neo-tree file explorer
vim.pack.add({
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' }
})

require('neo-tree').setup({
  window = {
    width = 30,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ['o'] = 'open',
      ['s'] = 'open_split',
      ['v'] = 'open_vsplit',
    }
  },
  filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = true,
  },
})

-- Explorer toggle (<leader>e)
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Explorer toggle' })
