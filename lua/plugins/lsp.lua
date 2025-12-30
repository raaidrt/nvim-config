-- LSP Configuration
vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig" } })

-- Lua Language Server (for Neovim and Hammerspoon)
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
          path ~= vim.fn.stdpath('config')
          and path ~= vim.fn.expand('~/.hammerspoon')
          and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    local library = {}
    local globals = {}
    local path = client.workspace_folders and client.workspace_folders[1].name or ''

    -- Neovim config support
    if path == vim.fn.stdpath('config') or path == '' then
      table.insert(library, vim.env.VIMRUNTIME)
    end

    -- Hammerspoon config support
    local hs_path = vim.fn.expand('~/.hammerspoon')
    if path == hs_path or vim.startswith(vim.api.nvim_buf_get_name(0), hs_path) then
      local hs_annotations = hs_path .. '/Spoons/EmmyLua.spoon/annotations'
      if vim.uv.fs_stat(hs_annotations) then
        table.insert(library, hs_annotations)
      end
      table.insert(globals, 'hs')
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      workspace = {
        checkThirdParty = false,
        library = library
      },
      diagnostics = {
        globals = globals
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

-- Typst Language Server
vim.lsp.config["tinymist"] = {
  cmd = { "tinymist" },
  filetypes = { "typst" },
}

-- Julia Language Server
vim.lsp.config["julia_lsp"] = {
  cmd = { vim.fn.expand("~/.juliaup/bin/julia"), "--project=@lsp", "-e", "using LanguageServer; runserver()" },
  filetypes = { "julia" },
  root_markers = { "Project.toml", ".git" },
}

-- Python: ty (type checker)
vim.lsp.config["ty"] = {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", ".git" },
}

-- Python: ruff (formatter/linter)
vim.lsp.config["ruff"] = {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
  settings = {
    ruff = {
      lint = { enable = false },
    }
  }
}

-- Enable LSP servers
vim.lsp.enable({ "lua_ls", "ty", "ruff", "tinymist", "zls", "julia_lsp" })
