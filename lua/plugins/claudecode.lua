-- Claude Code integration
vim.pack.add({ { src = 'https://github.com/coder/claudecode.nvim' } })

require('claudecode').setup({
  terminal = {
    split_side = "right",
    split_width_percentage = 0.40,
    provider = "snacks",
  },
  diff_opts = {
    auto_close_on_accept = true,
    vertical_split = true,
  },
})

-- AI/Claude keybindings (<leader>a)
local wk = require('which-key')
wk.add({
  { '<leader>a', group = 'AI (Claude)' },
  { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
  { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
  { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume session' },
  { '<leader>aR', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue session' },
  { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select model' },
  { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
  { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send selection' },
  { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
  { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Reject diff' },
})
