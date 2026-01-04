-- Which-Key Setup and All Keybinding Groups
vim.pack.add({ { src = 'https://github.com/folke/which-key.nvim' } })

local wk = require('which-key')
wk.setup()

-- Register all key groups with descriptions
wk.add({
  -- Window management (<leader>w)
  { '<leader>w', group = 'Window' },
  { '<leader>w/', '<C-w>v', desc = 'Split vertical' },
  { '<leader>w-', '<C-w>s', desc = 'Split horizontal' },

  -- LSP (<leader>l)
  { '<leader>l', group = 'LSP' },
  { '<leader>la', vim.lsp.buf.code_action, desc = 'Code action' },
  { '<leader>ld', vim.lsp.buf.definition, desc = 'Go to definition' },
  { '<leader>lD', vim.lsp.buf.declaration, desc = 'Go to declaration' },
  { '<leader>lf', function() vim.lsp.buf.format({ async = true }) end, desc = 'Format buffer' },
  { '<leader>lh', vim.lsp.buf.hover, desc = 'Hover documentation' },
  { '<leader>li', vim.lsp.buf.implementation, desc = 'Go to implementation' },
  { '<leader>lk', vim.lsp.buf.signature_help, desc = 'Signature help' },
  { '<leader>ln', vim.diagnostic.goto_next, desc = 'Next diagnostic' },
  { '<leader>lp', vim.diagnostic.goto_prev, desc = 'Previous diagnostic' },
  { '<leader>lr', vim.lsp.buf.rename, desc = 'Rename symbol' },
  { '<leader>lR', vim.lsp.buf.references, desc = 'Find references' },
  { '<leader>ls', vim.lsp.buf.document_symbol, desc = 'Document symbols' },
  { '<leader>lS', vim.lsp.buf.workspace_symbol, desc = 'Workspace symbols' },
  { '<leader>lt', vim.lsp.buf.type_definition, desc = 'Type definition' },
  { '<leader>le', vim.diagnostic.open_float, desc = 'Show diagnostic' },
  { '<leader>lq', vim.diagnostic.setloclist, desc = 'Diagnostics to loclist' },

  -- Buffer (<leader>b) - keybindings registered in navigation.lua after Snacks is loaded
  { '<leader>b', group = 'Buffer' },

  -- Search (<leader>s) - registered in navigation.lua after Snacks is loaded
  { '<leader>s', group = 'Search' },

  -- Git (<leader>g)
  { '<leader>g', group = 'Git' },

  -- Code/Compile (<leader>c)
  { '<leader>c', group = 'Code' },
  { '<leader>cc', ':update<CR>:make!<CR>', desc = 'Compile' },
  { '<leader>cs', ':update<CR>:source<CR>', desc = 'Source config' },

  -- Tabs (<leader>t)
  { '<leader>t', group = 'Tabs' },
  { '<leader>t]', '<Cmd>+tabnext<CR>', desc = 'Next tab' },
  { '<leader>t[', '<Cmd>-tabnext<CR>', desc = 'Previous tab' },
  -- <leader>tn is registered in navigation.lua after Snacks is loaded
})
