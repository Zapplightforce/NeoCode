# 🧭 NeoCode Navigation Guide

**A comprehensive guide to navigating NeoCode with Windows-style keyboard shortcuts**

---

## 📋 Table of Contents

- [Understanding NeoCode's Layout](#understanding-neocodes-layout)
- [Windows-Style Shortcuts](#windows-style-shortcuts)
- [tmux Pane Navigation](#tmux-pane-navigation)
- [LazyVim Features](#lazyvim-features)
- [Advanced Workflows](#advanced-workflows)
- [Troubleshooting](#troubleshooting)

---

## 🎯 Understanding NeoCode's Layout

NeoCode uses a hybrid architecture combining **tmux** and **Neovim** to create a VSCode-like experience:

### Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│ tmux Session: "neocode"                                     │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ tmux Window 1: "NeoCode"  │  Window 2: "Terminal"       │ │
│ │ (Acts like VSCode Tabs)   │                              │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                              │
│ ┌───────┬──────────────────────────────────────────────┐   │
│ │ Neo-  │  Neovim Bufferline (VSCode-like file tabs)   │   │
│ │ Tree  │  ┌──────────────────────────────────────┐    │   │
│ │       │  │  File Content Area                   │    │   │
│ │ File  │  │  (Active Buffer)                     │    │   │
│ │ Expl. │  │                                       │    │   │
│ │       │  └──────────────────────────────────────┘    │   │
│ └───────┴──────────────────────────────────────────────┘   │
│ ┌──────────────────────────────────────────────────────┐   │
│ │  Terminal Pane                  │  Git Pane          │   │
│ └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### Key Concepts

1. **tmux Windows** = VSCode Application Tabs (shown in tmux status bar)
2. **Neovim Buffers** = Open files (shown in bufferline at top)
3. **tmux Panes** = Split views (file explorer, terminal, git, etc.)
4. **One File Tree** = Shared across all buffers (not duplicated)

---

## ⌨️ Windows-Style Shortcuts

NeoCode is configured to work with familiar Windows shortcuts. These work in **Neovim** (the editor area).

### File Operations

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + S` | **Save File** | Save the current file |
| `Ctrl + Shift + S` | **Save All** | Save all modified buffers |
| `Ctrl + W` | **Close Tab** | Close current buffer (file) |
| `Ctrl + Shift + W` | **Close All** | Close all buffers and exit |
| `Ctrl + N` | **New File** | Create a new empty buffer |
| `Ctrl + O` | **Open File** | Open file picker (Telescope) |
| `Ctrl + P` | **Quick Open** | Quick file search (Telescope) |

### Editing

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + C` | **Copy** | Copy selected text (or line) |
| `Ctrl + X` | **Cut** | Cut selected text (or line) |
| `Ctrl + V` | **Paste** | Paste from clipboard |
| `Ctrl + Z` | **Undo** | Undo last change |
| `Ctrl + Y` | **Redo** | Redo last undone change |
| `Ctrl + A` | **Select All** | Select entire file content |
| `Ctrl + D` | **Duplicate Line** | Duplicate current line |
| `Ctrl + /` | **Toggle Comment** | Comment/uncomment line(s) |

### Line Manipulation

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Alt + ↑` | **Move Line Up** | Move current line up |
| `Alt + ↓` | **Move Line Down** | Move current line down |
| `Ctrl + D` | **Duplicate Line** | Duplicate current line below |

### Search and Replace

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + F` | **Find** | Search in current file |
| `Ctrl + H` | **Replace** | Find and replace in file |
| `Ctrl + Shift + F` | **Find in Files** | Search across all files (Telescope) |
| `n` | **Next Match** | Jump to next search result |
| `N` | **Previous Match** | Jump to previous result |

### Navigation

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + Tab` | **Next Buffer** | Switch to next open file |
| `Ctrl + Shift + Tab` | **Previous Buffer** | Switch to previous file |
| `Ctrl + PageDown` | **Next Buffer** | Alternative: next file |
| `Ctrl + PageUp` | **Previous Buffer** | Alternative: previous file |
| `Space + 1-9` | **Go to Buffer** | Jump to buffer by number |
| `F12` | **Go to Definition** | Jump to symbol definition (LSP) |
| `Ctrl + F12` | **Go to Implementation** | Jump to implementation (LSP) |
| `Shift + F12` | **Find References** | Find all references (LSP) |

### Panels and Views

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + B` | **Toggle Sidebar** | Show/hide file explorer |
| `Ctrl + Shift + E` | **Focus Explorer** | Open/focus file explorer |
| <code>Ctrl + `</code> | **Toggle Terminal** | Show/hide integrated terminal |
| `Ctrl + =` | **Zoom In** | Increase font size |
| `Ctrl + -` | **Zoom Out** | Decrease font size |

### Command Palette

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + Shift + P` | **Command Palette** | Show all available commands |
| `Space + ff` | **Find Files** | Find files in project |
| `Space + fg` | **Live Grep** | Search text in all files |
| `Space + fb` | **Find Buffers** | Show open buffers |
| `Space + fc` | **Find Commands** | Search commands |

---

## 🔀 tmux Pane Navigation

These shortcuts work at the **tmux level** (entire application), not just in Neovim.

### Smart Vim-tmux Navigation

These shortcuts work seamlessly between Neovim splits AND tmux panes:

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + H` | **Focus Left** | Move to pane/split on the left |
| `Ctrl + J` | **Focus Down** | Move to pane/split below |
| `Ctrl + K` | **Focus Up** | Move to pane/split above |
| `Ctrl + L` | **Focus Right** | Move to pane/split on the right |

### Alternative Pane Navigation

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Alt + ←` | **Focus Left** | Alternative: move left |
| `Alt + →` | **Focus Right** | Alternative: move right |
| `Alt + ↑` | **Focus Up** | Alternative: move up |
| `Alt + ↓` | **Focus Down** | Alternative: move down |

### Pane Management

**All tmux commands start with the prefix: `Ctrl + A`**

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + A` then `\|` | **Split Vertically** | Create vertical split |
| `Ctrl + A` then `-` | **Split Horizontally** | Create horizontal split |
| `Ctrl + A` then `X` | **Close Pane** | Kill current pane |
| `Ctrl + A` then `Z` | **Zoom Pane** | Toggle pane zoom (fullscreen) |
| `Ctrl + A` then `Space` | **Cycle Layout** | Change pane arrangement |

### Pane Resizing

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + Shift + ←` | **Resize Left** | Make pane narrower |
| `Ctrl + Shift + →` | **Resize Right** | Make pane wider |
| `Ctrl + Shift + ↑` | **Resize Up** | Make pane shorter |
| `Ctrl + Shift + ↓` | **Resize Down** | Make pane taller |

**Or with prefix (for larger steps):**

| Shortcut | Action |
|----------|--------|
| `Ctrl + A` then `H` | Resize left (5 units) |
| `Ctrl + A` then `L` | Resize right (5 units) |
| `Ctrl + A` then `J` | Resize down (5 units) |
| `Ctrl + A` then `K` | Resize up (5 units) |

### tmux Window (Tab) Navigation

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + ←` | **Previous Window** | Switch to previous tmux window |
| `Ctrl + →` | **Next Window** | Switch to next tmux window |
| `Ctrl + A` then `C` | **New Window** | Create new tmux window |
| `Ctrl + A` then `&` | **Kill Window** | Close current tmux window |
| `Ctrl + A` then `0-9` | **Go to Window** | Jump to window by number |

---

## ✨ LazyVim Features

LazyVim is the Neovim distribution powering NeoCode. Here are the key features:

### File Explorer (Neo-tree)

**Toggle:** `Ctrl + B` or `Ctrl + Shift + E` or `Space + e`

| Key | Action | Description |
|-----|--------|-------------|
| `Enter` | **Open File** | Open selected file |
| `l` | **Expand/Open** | Expand folder or open file |
| `h` | **Collapse** | Collapse folder |
| `a` | **Add File** | Create new file |
| `A` | **Add Directory** | Create new directory |
| `d` | **Delete** | Delete file/directory |
| `r` | **Rename** | Rename file/directory |
| `x` | **Cut** | Cut to clipboard |
| `c` | **Copy** | Copy file |
| `p` | **Paste** | Paste from clipboard |
| `R` | **Refresh** | Refresh tree |
| `?` | **Help** | Show all keybindings |
| `q` | **Close** | Close file explorer |
| `S` | **Split** | Open in horizontal split |
| `s` | **VSplit** | Open in vertical split |

### Telescope (Fuzzy Finder)

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + P` | **Find Files** | Quick file search |
| `Space + ff` | **Find Files** | Alternative |
| `Space + fg` | **Live Grep** | Search text in files |
| `Space + fb` | **Buffers** | Show open buffers |
| `Space + fh` | **Help Tags** | Search help |
| `Space + fc` | **Commands** | Search commands |
| `Space + fr` | **Recent Files** | Show recent files |

**Inside Telescope:**

| Key | Action |
|-----|--------|
| `Ctrl + J` / `↓` | Move down |
| `Ctrl + K` / `↑` | Move up |
| `Enter` | Select |
| `Ctrl + X` | Open in horizontal split |
| `Ctrl + V` | Open in vertical split |
| `Ctrl + T` | Open in new tab |
| `Esc` | Close |

### LSP (Language Server Protocol)

| Shortcut | Action | Description |
|----------|--------|-------------|
| `gd` | **Go to Definition** | Jump to definition |
| `gD` | **Go to Declaration** | Jump to declaration |
| `gr` | **References** | Find all references |
| `gi` | **Implementation** | Go to implementation |
| `K` | **Hover Documentation** | Show documentation |
| `Space + ca` | **Code Actions** | Show available code actions |
| `Space + rn` | **Rename Symbol** | Rename across project |
| `[d` | **Previous Diagnostic** | Jump to previous error |
| `]d` | **Next Diagnostic** | Jump to next error |
| `Space + D` | **Type Definition** | Show type definition |

### Git Integration

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Space + gg` | **LazyGit** | Open LazyGit interface |
| `Space + gb` | **Git Blame** | Show git blame |
| `Space + gd` | **Git Diff** | Show file diff |
| `]c` | **Next Hunk** | Jump to next git change |
| `[c` | **Previous Hunk** | Jump to previous change |
| `Space + hs` | **Stage Hunk** | Stage current hunk |
| `Space + hr` | **Reset Hunk** | Reset current hunk |

### Dashboard

Open with: `Space + ud` or type `:Dashboard`

The dashboard shows:
- Recent files
- Quick actions
- Project shortcuts

---

## 🚀 Advanced Workflows

### Opening Files as Buffers (Not Neovim Tabs)

**✅ CORRECT: Use buffers for files**
```
Space + ff           → Opens Telescope
Select file + Enter → Opens in new buffer (shown in bufferline)
```

**❌ INCORRECT: Don't use Neovim's :tabnew**
```
:tabnew file.txt    → Creates Neovim tab (NOT recommended)
```

**Why?** NeoCode uses **tmux windows** for application-level tabs and **Neovim buffers** for open files. This keeps the file tree in one shared pane.

### Managing the Dashboard

The LazyVim dashboard (welcome screen) is now accessible as a buffer:

```
Space + ud          → Open dashboard in current buffer
Ctrl + W            → Close dashboard like any buffer
```

### Split Workflows

**Vertical Split Example:**
```
1. Ctrl + A then |    → Create vertical split
2. Ctrl + L           → Focus right pane
3. Ctrl + P           → Open file in right pane
```

**Horizontal Split Example:**
```
1. Ctrl + A then -    → Create horizontal split  
2. Ctrl + J           → Focus bottom pane
3. Open terminal or another file
```

### Multiple Projects

You can run multiple NeoCode sessions:

```bash
# Terminal 1
./scripts/neocode-lazyvim start ~/project1

# Terminal 2  
./scripts/neocode-lazyvim start ~/project2
```

Switch between them:
```
Ctrl + A then s     → Show all sessions
Use arrow keys      → Select session
Enter              → Switch to session
```

### Terminal Integration

**Open terminal pane:**
```
Ctrl + `           → Toggle integrated terminal
```

**Inside terminal:**
```
Ctrl + A then d    → Detach from session (keeps running)
tmux attach        → Reattach to session
```

---

## 🎨 Customization

### Changing the Leader Key

The leader key is `Space` by default. You can change it in the Neovim config:

```lua
vim.g.mapleader = " "     -- Current (Space)
vim.g.maplocalleader = "," -- Local leader
```

### Adding Custom Shortcuts

Edit `~/.config/nvim/lua/config/neocode.lua` and add to the `setup_keymaps` function:

```lua
-- Example: Ctrl + Shift + D for duplicate selection
keymap('v', '<C-S-d>', 'y`>p', opts)
```

### Changing Themes

```
Space + uC         → Open colorscheme picker
Select theme       → Preview and apply
```

Or edit your LazyVim config:

```lua
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
```

---

## 📚 Quick Reference Card

### Essential Shortcuts

| Action | Shortcut | Context |
|--------|----------|---------|
| **Save** | `Ctrl + S` | Neovim |
| **Close** | `Ctrl + W` | Neovim |
| **Open File** | `Ctrl + P` | Neovim |
| **Copy** | `Ctrl + C` | Neovim |
| **Paste** | `Ctrl + V` | Neovim |
| **Undo** | `Ctrl + Z` | Neovim |
| **Find** | `Ctrl + F` | Neovim |
| **Toggle Explorer** | `Ctrl + B` | Neovim |
| **Split Vertical** | `Ctrl + A` then `\|` | tmux |
| **Navigate Panes** | `Ctrl + H/J/K/L` | Both |
| **Next Buffer** | `Ctrl + Tab` | Neovim |
| **Command Palette** | `Ctrl + Shift + P` | Neovim |

---

## 🔧 Troubleshooting

### File Tree Shows in Every Buffer

**Problem:** Neo-tree appears duplicated in each buffer.

**Solution:** This shouldn't happen with the new config. If it does:
1. Close all buffers: `:bufdo bd`
2. Restart NeoCode session
3. Open file tree once: `Ctrl + B`
4. Open files with `Ctrl + P` (they'll open in main area)

### Dashboard Overlays Editor

**Problem:** LazyVim dashboard blocks the editor.

**Solution:** 
- Press `Esc` to close dashboard
- Or use `Space + ud` to open it as a buffer instead

### Shortcuts Not Working

**Problem:** Windows-style shortcuts don't work.

**Solution:**
1. Ensure you're in Neovim (not terminal pane)
2. Check you're in Normal mode (press `Esc`)
3. Source the config: `:lua require('config.neocode').setup()`

### Can't Navigate Between Panes

**Problem:** `Ctrl + H/J/K/L` doesn't switch panes.

**Solution:**
1. Make sure vim-tmux-navigator is installed
2. Check tmux config is loaded: `Ctrl + A` then `r`
3. Use alternative: `Alt + Arrow Keys`

### tmux Prefix Not Working

**Problem:** `Ctrl + A` doesn't work as tmux prefix.

**Solution:**
- Default tmux prefix is `Ctrl + B`, but we changed it
- Check if tmux config loaded: `tmux source ~/.config/neocode/tmux.conf`
- Or use default: `Ctrl + B` instead

---

## 📖 Additional Resources

- **LazyVim Documentation:** https://www.lazyvim.org/
- **tmux Guide:** https://github.com/tmux/tmux/wiki
- **Neovim Documentation:** `:help` or https://neovim.io/doc/
- **Telescope Commands:** `Space + fc` (in NeoCode)
- **Neo-tree Help:** Press `?` when file tree is open

---

## 🎯 Key Takeaways

1. **Use Buffers for Files** → Shown in top bufferline (like VSCode tabs)
2. **One File Tree** → Shared across all buffers in left pane
3. **tmux Windows** → For completely separate workspaces
4. **Windows Shortcuts** → Familiar Ctrl+S, Ctrl+C, Ctrl+V, etc.
5. **Smart Navigation** → Ctrl+H/J/K/L works everywhere
6. **Dashboard as Buffer** → Use `Space + ud` to open

---

**Happy Coding with NeoCode! 🚀**

*Last Updated: November 13, 2025*
