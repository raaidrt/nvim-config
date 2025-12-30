-- Autocommands

-- LSP Attach: Enable auto-completion
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      vim.bo[args.buf].completeopt = "menu,menuone,noinsert,noselect"
    end
  end,
})

-- File-specific make commands
local compilation_commands = {
  ['*.typ'] = 'typst compile %',
  ['*.py'] = 'uv run %'
}

vim.api.nvim_create_augroup('FileMakeCmd', { clear = false })

for pattern, command in pairs(compilation_commands) do
  vim.api.nvim_create_autocmd({ 'FileType', 'BufEnter' }, {
    pattern = pattern,
    group = 'FileMakeCmd',
    callback = function()
      vim.opt_local.makeprg = command
    end
  })
end
