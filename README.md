# `wipdev`'s Neovim Configuration

The basis for this config was
[Kickstart](https://github.com/nvim-lua/kickstart.nvim), which is a sensible
setup for package management, LSP, completion, etc. I don't sync my config with
it - just took it as a starting point and started hacking. I have no planning
of doing such sync later because I refactored the code to span more than one
file (and configure each plugin in its own file, more or less).

## Requirements

Some system-level dependencies are needed. While these will be very likely
already installed, that might not be the case with fresh OS installations. To
install these dependencies on Ubuntu/Debian, run this command:

```bash
sudo apt install gcc g++ git ripgrep curl
```

Language-specific dependencies may be required for language servers (e.g., Go
for `gopls` and NPM for `tsserver`).

## Installation

Neovim's config path should be `~/.config/nvim`. So, to add this config to a
fresh Neovim installation, the easiest way to do it is to `cd` into
`~/.config/` and run this command:

```bash
git clone git@github.com:wipdev-tech/nvim-config.git nvim
```
