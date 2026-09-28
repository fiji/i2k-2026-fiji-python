#!/bin/bash
# Convenience script to build Slidev for production
# Automatically handles Node.js version switching

set -e

echo "🏗️  Building Fiji + Python Workshop Slides..."

# Check if nvm is available
if command -v nvm &> /dev/null; then
    echo "📦 Switching to Node.js version from .nvmrc..."
    nvm use --delete-prefix
elif [ -f "$HOME/.nvm/nvm.sh" ]; then
    echo "📦 Loading nvm and switching Node.js version..."
    source "$HOME/.nvm/nvm.sh"
    nvm use --delete-prefix
elif command -v fnm &> /dev/null; then
    echo "📦 Switching to Node.js version from .nvmrc..."
    eval "$(fnm env)"
    fnm use
else
    echo "⚠️  Warning: nvm or fnm not found. Make sure you have Node.js 20+ installed."
    echo "Current Node version: $(node --version)"
fi

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "📥 Installing dependencies..."
    npm install
fi

echo "🔨 Building static site..."
npm run build

echo "✅ Build complete! Output is in ./dist/"
echo "💡 To preview: cd dist && python -m http.server 8080"
