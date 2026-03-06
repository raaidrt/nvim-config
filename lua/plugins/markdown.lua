-- Markdown rendering
vim.pack.add({
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  { src = "https://github.com/selimacerbas/live-server.nvim" },
  { src = "https://github.com/selimacerbas/markdown-preview.nvim" },
})

require('render-markdown').setup({})
require('markdown_preview').setup({})
