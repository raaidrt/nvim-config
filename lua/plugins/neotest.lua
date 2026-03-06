-- Neotest: run tests from within Neovim
vim.pack.add({
  { src = 'https://github.com/nvim-neotest/neotest' },
  { src = 'https://github.com/nvim-neotest/nvim-nio' },
  { src = 'https://github.com/antoinemadec/FixCursorHold.nvim' },
  { src = 'https://github.com/nvim-neotest/neotest-python' },
  { src = 'https://github.com/rouge8/neotest-rust' },
})

require('neotest').setup({
  adapters = {
    require('neotest-python')({
      runner = 'pytest',
    }),
    require('neotest-rust'),
  },
})

-- Test keybindings (<leader>t)
local wk = require('which-key')
local neotest = require('neotest')

wk.add({
  { '<leader>t', group = 'test' },
  { '<leader>tr', function() neotest.run.run() end, desc = 'Run nearest test' },
  { '<leader>tf', function() neotest.run.run(vim.fn.expand('%')) end, desc = 'Run file tests' },
  { '<leader>ts', function() neotest.summary.toggle() end, desc = 'Toggle summary' },
  { '<leader>to', function() neotest.output.open({ enter = true }) end, desc = 'Show output' },
  { '<leader>tp', function() neotest.output_panel.toggle() end, desc = 'Toggle output panel' },
  { '<leader>tl', function() neotest.run.run_last() end, desc = 'Run last test' },
  { '<leader>tx', function() neotest.run.stop() end, desc = 'Stop test' },
  { '<leader>td', function() neotest.run.run({ strategy = 'dap' }) end, desc = 'Debug nearest test' },
})
