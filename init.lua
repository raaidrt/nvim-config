-- Default Vim Options
vim.o.number = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.swapfile = false
vim.g.mapleader = ' '

-- Default Keybindings
vim.keymap.set('n', '<leader>o', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('n', '<leader>w/', '<C-w>v')
vim.keymap.set('n', '<leader>w-', '<C-w>s')

-- Visuals
vim.pack.add({ { src = "https://github.com/shaunsingh/nord.nvim" } })
vim.cmd([[colorscheme nord]])
vim.cmd([[:hi statusline guibg=#8FBCBB guifg=BLACK]])

-- LSP setup
vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig" } })
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
          path ~= vim.fn.stdpath('config')
          and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

vim.lsp.config["tinymist"] = {
  cmd = { "tinymist" },
  filetypes = { "typst" },
}

vim.lsp.enable({ "lua_ls", "ruff", "tinymist", "zls" })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true })

-- Oil + Mini Pick
vim.pack.add({ { src = 'https://github.com/stevearc/oil.nvim', }, { src = 'https://github.com/nvim-mini/mini.pick' } })
require 'oil'.setup()
require 'mini.pick'.setup()
vim.keymap.set('n', '<leader>e', '<Cmd>Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      -- client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })

      vim.keymap.set('i', '<C-n>', function()
        vim.lsp.completion.trigger()
      end, { buffer = args.buf })
    end
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

-- Compilation
local compilation_commands = {
  ['*.typ'] = 'typst compile %'
}

vim.api.nvim_create_augroup('FileMakeCmd', {
  clear = false
})

for pattern, command in pairs(compilation_commands) do
  vim.api.nvim_create_autocmd({ 'FileType', 'BufEnter' }, {
    pattern = pattern,
    group = 'FileMakeCmd',
    callback = function()
      vim.opt_local.makeprg = command
    end
  })
end

vim.keymap.set('n', '<leader>cc', ':update<CR>:make!<CR>')

-- Custom Formatting
local formatting_commands = {
  ['*.typ'] = 'typstyle --inplace %'
}

vim.api.nvim_create_augroup('FormatCmd', {
  clear = false
})

for pattern, command in pairs(formatting_commands) do
  vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = pattern,
    group = 'FormatCmd',
    callback = function()
      local filename = vim.fn.expand('%')
      local cmd = command:gsub('%%', filename)
      vim.fn.jobstart(cmd, {
        on_exit = function(_, exit_code)
          if exit_code == 0 then
            -- Reload the buffer from disk to see formatting changes
            vim.cmd('checktime')
          else
            vim.notify('Formatting failed with exit code: ' .. exit_code, vim.log.levels.ERROR)
          end
        end
      })
    end
  })
end

-- Git Client
vim.pack.add({ { src = "https://github.com/nvim-lua/plenary.nvim" } })
vim.pack.add({ { src = "https://github.com/NeogitOrg/neogit" } })
vim.keymap.set('n', '<leader>gg', '<Cmd>Neogit<CR>')

-- Tabs
vim.keymap.set('n', '<leader>t', '<Cmd>tabnew<CR><Cmd>Pick files<CR>')
vim.keymap.set('n', '<leader>]', '<Cmd>+tabnext<CR>')
vim.keymap.set('n', '<leader>[', '<Cmd>-tabnext<CR>')
