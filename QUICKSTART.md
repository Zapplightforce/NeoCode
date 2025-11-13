# NeoCode - Quick Start

## Build & Run

```bash
# Start container
docker-compose up -d

# Enter container
docker-compose exec neocode bash

# Inside container - start LazyVim
nvim
```

## That's It

LazyVim is already configured and ready to use.

## Basic Shortcuts

- `Space + e` - File explorer
- `Space + Space` - Find files  
- `Ctrl + /` - Terminal
- `:q` - Quit

Full docs: https://www.lazyvim.org/

## Stop Container

```bash
docker-compose down
```

## Rebuild (if needed)

```bash
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```
