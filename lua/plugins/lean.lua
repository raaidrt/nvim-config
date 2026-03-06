-- Lean 4
vim.pack.add({ { src = "https://github.com/Julian/lean.nvim" } })

require('lean').setup({
  lsp = {},
  mappings = true,
})
