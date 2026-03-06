-- Amp (Sourcegraph) integration
vim.pack.add({ { src = 'https://github.com/sourcegraph/amp.nvim', checkout = 'main' } })

require('amp').setup({
  auto_start = true,
  log_level = 'info',
})
