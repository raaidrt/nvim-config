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

-- Buffer keybindings (<leader>b)
wk.add({
  { '<leader>bb', '<cmd>b#<cr>', desc = 'Alternate buffer' },
  { '<leader>bl', function() Snacks.picker.buffers() end, desc = 'List buffers' },
  { '<leader>bd', '<cmd>bdelete<cr>', desc = 'Delete buffer' },
  { '<leader>bD', '<cmd>bdelete!<cr>', desc = 'Delete buffer (force)' },
  { '<leader>bn', '<cmd>bnext<cr>', desc = 'Next buffer' },
  { '<leader>bp', '<cmd>bprevious<cr>', desc = 'Previous buffer' },
  { '<leader>bs', '<cmd>write<cr>', desc = 'Save buffer' },
  { '<leader>bw', '<cmd>write | bdelete<cr>', desc = 'Save and close' },
  { '<leader>bo', '<cmd>%bdelete | edit# | bdelete#<cr>', desc = 'Close other buffers' },
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
