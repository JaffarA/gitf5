# gitf5

A smart git utility that refreshes your main and development branches while preserving your workflow.

## Features

- Automatically detects and refreshes both main branch (`main`/`master`) and development branch (`develop`/`dev`)
- Stays on your current branch by default
- Optionally switches to a specified branch
- Pure bash implementation - no dependencies beyond git
- Works as both a standalone script and a sourced function

## Installation

Add to your `.bashrc`, `.zshrc`, or similar by sourcing the script:

```bash
source /path/to/gitf5.sh
```

Alternatively, simple paste the contents of gitf5.sh into your `.bashrc`, `.zshrc` or similar.

## Usage

```bash
# Refresh main/develop branches and return to current branch
gitf5

# Refresh main/develop branches and switch to feature-branch
gitf5 feature-branch
```

## How it works

1. Detects your repository's main branch (`main` or `master`)
2. Detects your repository's development branch (`develop` or `dev`) if it exists
3. Switches to and refreshes each branch (fetch + prune)
4. Returns to your original branch (or switches to specified branch if provided)

## License

MIT License - feel free to use and modify as you like!
