# Fiji + Python Workshop Slides

Interactive slides for the I2K×BINA 2026 Fiji + Python workshop, built with [Slidev](https://sli.dev/).

Evolved from [the "Halfway to I2K" 2025 Appose workshop](https://github.com/fiji/i2k-2025-appose).

## Prerequisites

### Node.js Version

This project requires **Node.js 20 or later**. Ubuntu's repository version is too old.

#### Option 1: Install nvm (Node Version Manager) - Recommended

```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Restart your terminal or run:
source ~/.bashrc

# Install and use Node.js 20
nvm install 20
nvm use --delete-prefix 20
```

The `--delete-prefix` flag is needed if you have npm's `prefix` setting configured (e.g., for Claude Code).

#### Option 2: Install fnm (Fast Node Manager) - Alternative

```bash
# Install fnm
curl -fsSL https://fnm.vercel.app/install | bash
source ~/.bashrc

# Install and use Node.js 20
fnm install 20
fnm use 20
```

#### Auto-switching with .nvmrc

This project includes a `.nvmrc` file. With nvm or fnm installed, you can:

```bash
nvm use  # automatically uses version from .nvmrc
# or
fnm use  # automatically uses version from .nvmrc
```

You can also configure your shell to auto-switch. Add to `~/.bashrc`:

```bash
# For nvm:
cd() { builtin cd "$@" && nvm use 2>/dev/null; }

# For fnm:
eval "$(fnm env --use-on-cd)"
```

## Local Development

### Quick Start (Using convenience script)

```bash
./dev.sh
```

This script automatically:
- Switches to the correct Node.js version
- Installs dependencies if needed
- Starts the dev server

### Manual Setup

Install dependencies:

```bash
npm install
```

Start the dev server with hot reload:

```bash
npm run dev
```

This will open the presentation in your browser at http://localhost:3030

## Build for Production

### Quick Build (Using convenience script)

```bash
./build.sh
```

This script automatically:
- Switches to the correct Node.js version
- Installs dependencies if needed
- Builds the static site

### Manual Build

Build static files for deployment:

```bash
npm run build
```

The built files will be in the `dist` folder, ready for deployment.

## Export to PDF

Export slides to PDF:

```bash
npm run export
```

## Presenter Mode

When running locally, press `?` to see keyboard shortcuts, or click the presenter icon to enter presenter mode with:
- Speaker notes
- Next slide preview
- Timer

## Key Features

- **Interactive code blocks** - Click to highlight different lines
- **v-click animations** - Progressive content reveal
- **Two-column layouts** - Side-by-side comparisons
- **Syntax highlighting** - For Bash, Python, Groovy, Java
- **Offline support** - Works without internet after initial setup

## Deployment

### GitHub Pages

This repository is configured to automatically deploy to GitHub Pages via GitHub Actions whenever you push to the `main` branch.

The slides are available at: `https://fiji.github.io/i2k-2026-fiji-python/`

### Manual Deployment

Build and deploy to any static hosting:

```bash
npm run build
# Upload the dist/ folder to your host
```

## Customization

Edit `slides.md` to modify the presentation content. Slidev uses Markdown with special directives:

- `---` separates slides
- `layout: name` sets slide layout
- `<v-click>` adds click-to-reveal
- `<v-clicks>` adds multiple reveals
- Code blocks with `{1|2|3}` for line highlighting

See [Slidev documentation](https://sli.dev/) for more features.
