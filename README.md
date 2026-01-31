# Neovim Configuration

A modular Neovim configuration using Lua.

## Structure

```
~/.config/nvim/
├── init.lua                    # Entry point - loads all modules
├── lua/
│   ├── core/
│   │   ├── options.lua         # Vim options (tabs, line numbers, etc.)
│   │   ├── keymaps.lua         # Basic keymaps
│   │   └── autocmds.lua        # Autocommands (LSP attach, makeprg)
│   └── plugins/
│       ├── theme.lua           # Everforest theme
│       ├── lsp.lua             # LSP server configurations
│       ├── which-key.lua       # Keybinding groups and descriptions
│       ├── navigation.lua      # Oil, Snacks picker, Neo-tree
│       ├── git.lua             # Neogit
│       ├── treesitter.lua      # TreeSitter configuration
│       ├── statusline.lua      # Lualine statusline
│       └── claudecode.lua      # Claude Code AI assistant
└── README.md
```

## Keybindings

Leader key: `<Space>`

### Window (`<leader>w`)
| Key | Action |
|-----|--------|
| `<leader>w/` | Split vertical |
| `<leader>w-` | Split horizontal |

### LSP (`<leader>l`)
| Key | Action |
|-----|--------|
| `<leader>la` | Code action |
| `<leader>ld` | Go to definition |
| `<leader>lD` | Go to declaration |
| `<leader>lf` | Format buffer |
| `<leader>lh` | Hover documentation |
| `<leader>li` | Go to implementation |
| `<leader>lk` | Signature help |
| `<leader>ln` | Next diagnostic |
| `<leader>lp` | Previous diagnostic |
| `<leader>lr` | Rename symbol |
| `<leader>lR` | Find references |
| `<leader>ls` | Document symbols |
| `<leader>lS` | Workspace symbols |
| `<leader>lt` | Type definition |
| `<leader>le` | Show diagnostic |
| `<leader>lq` | Diagnostics to loclist |

### Search (`<leader>s`)
| Key | Action |
|-----|--------|
| `<leader>sf` | Search files |
| `<leader>sg` | Search grep (in files) |
| `<leader>sh` | Search help |

### Git (`<leader>g`)
| Key | Action |
|-----|--------|
| `<leader>gg` | Open Neogit |

### AI / Claude (`<leader>a`)
| Key | Action |
|-----|--------|
| `<leader>ac` | Toggle Claude Code terminal |
| `<leader>af` | Focus Claude (smart toggle) |
| `<leader>ar` | Resume previous session |
| `<leader>aR` | Continue session |
| `<leader>am` | Select model |
| `<leader>ab` | Add current buffer to context |
| `<leader>as` | Send selection to Claude (visual) |
| `<leader>aa` | Accept diff |
| `<leader>ad` | Reject diff |

### Code (`<leader>c`)
| Key | Action |
|-----|--------|
| `<leader>cc` | Compile (run makeprg) |
| `<leader>cs` | Source config |

### Tabs (`<leader>t`)
| Key | Action |
|-----|--------|
| `<leader>tn` | New tab with file picker |
| `<leader>t]` | Next tab |
| `<leader>t[` | Previous tab |

### Explorer
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle Neo-tree |

## Plugins

| Plugin | Purpose |
|--------|---------|
| [everforest-nvim](https://github.com/neanias/everforest-nvim) | Color scheme |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding hints |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File editor |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Fuzzy picker |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [neogit](https://github.com/NeogitOrg/neogit) | Git client |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code AI assistant |

## LSP Servers

Configured servers:
- `lua_ls` - Lua (with Neovim and Hammerspoon support)
- `tinymist` - Typst
- `julia_lsp` - Julia
- `ty` - Python (type checking)
- `ruff` - Python (formatting)
- `zls` - Zig

## File-specific Commands

The `:make` command is configured per filetype:
- `*.typ` - `typst compile %`
- `*.py` - `uv run %`

Use `<leader>cc` to compile the current file.

## Claude Code

The [claudecode.nvim](https://github.com/coder/claudecode.nvim) plugin provides integration with Claude Code CLI.

### Requirements

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed and configured

### Usage

1. `<leader>ac` - Open Claude Code in a split terminal
2. `<leader>ab` - Add current buffer to Claude's context
3. In visual mode, select code and press `<leader>as` to send it to Claude
4. When Claude proposes changes, use `<leader>aa` to accept or `<leader>ad` to reject
