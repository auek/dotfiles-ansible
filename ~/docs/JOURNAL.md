# Learning Journal

## 2026-02-19
### Dotfiles
- **TMUX: Clipboard Sync**: Resolved conflicts between `pbcopy` (macOS) and `powershell.exe` (WSL) for yanking (`y`) and pasting (`p`).
- **TMUX: Visual Block**: Configured `C-v` in copy-mode to trigger `rectangle-toggle` for block selections.
- **TMUX: Navigation**: Use `Alt + h/j/k/l` to move between panes directly (bypassing prefix).
- **TMUX: Pane selection**: Use `C-s q` to display pane indexes and jump to them.
- **Neovim: Command History**: Mapped `C-f` in command mode (`:`) to fuzzy search history via Telescope.
- **Neovim: API Modernization**: Updated `init.lua` to use `vim.uv` instead of the deprecated `vim.loop`.
- **Neovim: File Sync**: Implemented `checktime` autocommands to detect and reload external file changes automatically.
