# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Architecture

This is a Neovim configuration built on **LazyVim** distribution using the **lazy.nvim** plugin manager.

**Key architectural pattern**: LazyVim provides sensible defaults; custom files in `lua/config/` and `lua/plugins/` selectively override/extend them.

**Entry point**: `init.lua` → `lua/config/lazy.lua` (bootstraps lazy.nvim) → discovers all plugin specs in `lua/plugins/`

**Plugin loading**: Lazy-loaded based on events, commands, keybindings, or filetypes. Plugin versions locked in `lazy-lock.json`.

## Directory Structure

```
lua/
├── config/           # Core Neovim settings loaded early
│   ├── lazy.lua      # Plugin manager setup & bootstrap
│   ├── options.lua   # Editor options (minimal - disables swapfile only)
│   ├── keymaps.lua   # Custom keybindings
│   ├── lsp.lua       # LSP server configurations
│   └── autocmds.lua  # Auto commands (empty - uses LazyVim defaults)
└── plugins/          # Plugin specifications (auto-discovered by lazy.nvim)
    ├── colorscheme.lua
    ├── treesitter.lua
    ├── toggleterm.lua
    ├── tmux.lua
    ├── hop.lua
    └── java/init.lua
```

## Language Server Configuration

LSP servers managed via **Mason** + **nvim-lspconfig**. Configuration in `lua/config/lsp.lua`:

### TypeScript/JavaScript
- Server: `tsserver` via `typescript.nvim` wrapper
- **Node version locked**: Uses Node 18 (`nvm use default 18` in setup)
- Custom keybindings:
  - `<leader>co` - Organize imports
  - `<leader>cR` - Rename file

### Java
- Server: `jdtls` via `nvim-java`
- **JVM configuration**: ZGC garbage collector, 8GB heap (`-Xmx8G`), GC logging enabled
- Test and debug adapter support configured
- **Note**: Recent addition, still being iterated on

### Python
- Server: `ruff` (native language server, NOT ruff-lsp)
- **Recent change**: Migrated from pyright + black to ruff
- Auto import via LSP code actions: `<leader>ca`

### Other Languages
- Go: `gopls`
- Rust: `rust-analyzer`
- Bash: ESLint + shfmt

## Custom Keybindings

### Insert Mode
- `jk` → Escape to normal mode

### Normal Mode
- `\w` / `\b` → Hop.nvim word hints (EasyMotion-style jumping)
- `K` → LSP hover documentation

### Tmux Integration (vim-tmux-navigator)
- `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` → Navigate between Neovim/Tmux panes
- `<C-\>` → Previous pane

### Terminal
- `<leader>tt` → Toggle floating vertical terminal (40% width)

## Common Commands

### Plugin Management
```vim
:Lazy               " Open plugin manager UI
:Lazy update        " Update all plugins
:Lazy sync          " Install missing + update + clean
```

### LSP
```vim
:Mason              " Open LSP/formatter installer UI
:LspInfo            " Show active LSP clients
:LspRestart         " Restart LSP servers
```

### Code Formatting
- Stylua config in `stylua.toml` (column width: 120)
- Format on save configured via LazyVim defaults

## Development Workflow Notes

1. **Plugin modifications**: Add new plugin specs to `lua/plugins/` - they're auto-discovered
2. **LSP additions**: Update `servers` table in `lua/config/lsp.lua` + add to Mason's `ensure_installed`
3. **Testing changes**: Restart Neovim or `:Lazy reload {plugin-name}`
4. **Node version dependency**: TypeScript setup hardcoded to Node 18 - update in `lsp.lua:30` if needed
5. **Minimal custom options**: Configuration intentionally delegates to LazyVim defaults - avoid over-customization

## Recent Changes (from git history)

- **Python tooling**: Switched from black + pyright to ruff (commit 9d34762)
- **Java support**: Added nvim-java with custom JVM tuning (commit 8d67bfa)
- **Tmux navigation**: Integrated vim-tmux-navigator (commit 318f8db, with reverts suggesting iteration)
