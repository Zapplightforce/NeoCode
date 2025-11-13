# 🎯 NeoCode Quick Reference Card

**Print this out or keep it open while learning NeoCode!**

---

## 🔑 Essential Shortcuts (Top 20)

| Action | Shortcut | Notes |
|--------|----------|-------|
| **Save File** | `Ctrl + S` | Works in insert & normal mode |
| **Close Tab** | `Ctrl + W` | Closes current buffer |
| **Open File** | `Ctrl + P` | Fuzzy file finder |
| **Find in Files** | `Ctrl + Shift + F` | Search across project |
| **Copy** | `Ctrl + C` | Copy line or selection |
| **Paste** | `Ctrl + V` | Paste from clipboard |
| **Undo** | `Ctrl + Z` | Undo last change |
| **Redo** | `Ctrl + Y` | Redo undone change |
| **Find** | `Ctrl + F` | Search in current file |
| **Toggle Explorer** | `Ctrl + B` | Show/hide file tree |
| **Next Tab** | `Ctrl + Tab` | Next open file |
| **Previous Tab** | `Ctrl + Shift + Tab` | Previous file |
| **Comment Line** | `Ctrl + /` | Toggle comment |
| **Go to Definition** | `F12` | Jump to symbol (LSP) |
| **Navigate Panes** | `Ctrl + H/J/K/L` | Vim-style movement |
| **Command Palette** | `Ctrl + Shift + P` | Show all commands |
| **New File** | `Ctrl + N` | Create new buffer |
| **Move Line Down** | `Alt + ↓` | Move current line |
| **Move Line Up** | `Alt + ↑` | Move current line |
| **Select All** | `Ctrl + A` | Select entire file |

---

## 📁 File Explorer (Neo-tree)

**Toggle:** `Ctrl + B`

| Key | Action |
|-----|--------|
| `Enter` | Open file |
| `a` | Add file |
| `A` | Add directory |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `R` | Refresh |
| `?` | Show help |
| `q` | Close tree |

---

## 🔍 Telescope (Fuzzy Finder)

| Shortcut | Action |
|----------|--------|
| `Ctrl + P` | Find files |
| `Space + ff` | Find files (alt) |
| `Space + fg` | Search text (grep) |
| `Space + fb` | Open buffers |
| `Space + fr` | Recent files |
| `Space + fc` | Commands |

**Inside Telescope:**
- `Ctrl + J/K` or `↓/↑` - Navigate
- `Enter` - Select
- `Esc` - Close

---

## 🪟 tmux Pane Management

**All tmux commands start with:** `Ctrl + A`

| Command | Action |
|---------|--------|
| `Ctrl + A` then `\|` | Split vertically |
| `Ctrl + A` then `-` | Split horizontally |
| `Ctrl + A` then `X` | Close pane |
| `Ctrl + A` then `Z` | Zoom/unzoom pane |
| `Ctrl + A` then `Space` | Cycle layouts |
| `Ctrl + A` then `[` | Enter copy mode |

**Quick Navigation (no prefix):**
- `Ctrl + H/J/K/L` - Move between panes
- `Alt + Arrow` - Alternative navigation
- `Ctrl + Left/Right` - Switch tmux windows

**Resize Panes:**
- `Ctrl + Shift + Arrows` - Small adjustments
- `Ctrl + A` then `H/J/K/L` - Large adjustments

---

## 💻 Vim Modes Quick Guide

| Mode | How to Enter | Indicator |
|------|--------------|-----------|
| **Normal** | `Esc` | `NORMAL` |
| **Insert** | `i` or `a` | `INSERT` |
| **Visual** | `v` | `VISUAL` |
| **Visual Line** | `V` | `VISUAL LINE` |
| **Command** | `:` | `:` prompt |

**Basic Vim Navigation (Normal Mode):**
- `h/j/k/l` - Left/Down/Up/Right
- `w` - Next word
- `b` - Previous word
- `0` - Start of line
- `$` - End of line
- `gg` - Top of file
- `G` - Bottom of file

**Editing (Normal Mode):**
- `i` - Insert before cursor
- `a` - Insert after cursor
- `o` - New line below
- `O` - New line above
- `dd` - Delete line
- `yy` - Copy line
- `p` - Paste below
- `u` - Undo
- `Ctrl + R` - Redo

---

## 🎨 LSP Features

| Shortcut | Action |
|----------|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Show documentation |
| `Space + ca` | Code actions |
| `Space + rn` | Rename symbol |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

---

## 📂 Buffer Management

| Shortcut | Action |
|----------|--------|
| `Ctrl + Tab` | Next buffer |
| `Ctrl + Shift + Tab` | Previous buffer |
| `Space + 1-9` | Jump to buffer # |
| `Ctrl + W` | Close buffer |
| `Space + fb` | List all buffers |

---

## 🎛️ Special Features

| Shortcut | Action |
|----------|--------|
| `Space + ud` | Open dashboard |
| `Space + gg` | Open LazyGit |
| `Space + uC` | Change colorscheme |
| <code>Ctrl + `</code> | Toggle terminal |
| `Ctrl + =` | Zoom in |
| `Ctrl + -` | Zoom out |

---

## 🆘 Getting Help

| Command | Description |
|---------|-------------|
| `:help` | Neovim help |
| `Space + ?` | LazyVim help |
| `?` (in neo-tree) | File explorer help |
| `?` (in Telescope) | Telescope help |
| `Ctrl + A` then `?` | tmux help |

---

## 🔄 Common Workflows

### Opening a File
```
1. Ctrl + P          (Open file finder)
2. Type filename
3. Enter             (Open in buffer)
```

### Splitting View
```
1. Ctrl + A then |   (Split vertically)
2. Ctrl + L          (Focus right pane)
3. Ctrl + P          (Open file in right)
```

### Search and Replace
```
1. Ctrl + H          (Start replace)
2. Type: pattern/replacement/g
3. Enter             (Apply)
```

### Working with Multiple Files
```
1. Ctrl + P → Open file 1 (shown in tab 1)
2. Ctrl + P → Open file 2 (shown in tab 2)
3. Ctrl + P → Open file 3 (shown in tab 3)
4. Ctrl + Tab → Switch between them
```

### Using Git
```
1. Ctrl + A then J   (Focus bottom pane)
2. Type git commands
3. Or Space + gg     (Open LazyGit UI)
```

---

## ⚠️ Common Mistakes

| ❌ Don't Do | ✅ Do Instead |
|------------|--------------|
| `:tabnew file.txt` | `Ctrl + P` (use buffers) |
| Multiple file trees | One shared tree (Ctrl + B) |
| `Ctrl + S` not working | Press `Esc` first (exit insert mode) |
| Can't navigate panes | Use `Ctrl + H/J/K/L` |
| Lost in vim modes | Press `Esc` to return to Normal |

---

## 📚 Resources

- **Full Navigation Guide:** `docs/Navigation-Guide.md`
- **Setup Instructions:** `docs/LazyVim-Setup-Guide.md`
- **LazyVim Docs:** https://www.lazyvim.org/
- **tmux Guide:** `man tmux` or `Ctrl + A` then `?`

---

## 💡 Pro Tips

1. **Learn Vim Motions:** Even with Windows shortcuts, vim motions are faster
2. **Use Leader Key:** `Space` gives access to most LazyVim features
3. **Telescope Everything:** `Ctrl + P` and `Space + f*` are your friends
4. **Zoom Panes:** `Ctrl + A` then `Z` to focus one pane temporarily
5. **Copy Mode:** `Ctrl + A` then `[` to scroll and copy in tmux
6. **Persistent Sessions:** tmux sessions survive disconnects
7. **One File Tree:** Don't open multiple explorers, use `Ctrl + B`
8. **Dashboard Access:** Use `Space + ud` to open as a tab

---

**Keep this handy while learning! 🚀**

*Print-friendly version available in `docs/` directory*
