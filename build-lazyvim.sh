#!/bin/bash
# Build and test NeoCode with LazyVim

echo "🚀 Building NeoCode with LazyVim..."

# Build the enhanced Docker image
docker build -f Dockerfile.lazyvim -t neocode-lazyvim .

echo ""
echo "✅ Build complete! 🎉"
echo ""
echo "🔥 Ready to test the enhanced VSCode-like experience:"
echo ""
echo "  docker run -it --rm -v \${PWD}:/workspace neocode-lazyvim"
echo ""
echo "Then inside the container, try:"
echo "  neocode start"
echo ""
echo "This will give you:"
echo "  ✨ LazyVim with VSCode-like file explorer always visible"
echo "  🎯 Modern plugin management with Lazy.nvim"
echo "  🚀 LSP support, syntax highlighting, and more out of the box"
echo "  📁 File tree (Space+e), fuzzy finding (Space+ff), and all LazyVim features"
echo ""