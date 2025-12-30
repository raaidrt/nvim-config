-- Neovim Configuration Entry Point
-- Load core settings first
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Load plugins
require('plugins.theme')
require('plugins.lsp')
require('plugins.which-key')
require('plugins.navigation')
require('plugins.git')
require('plugins.treesitter')
require('plugins.statusline')
