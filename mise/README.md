# mise module

Manages `~/.config/mise/config.toml` via GNU Stow.

[mise](https://mise.jdx.dev) is a polyglot runtime manager (replaces nvm, rbenv, pyenv, etc.).

## Tools

| Tool      | Version  |
|-----------|----------|
| node      | 24 (LTS) |
| java      | temurin-21 |
| glab      | latest   |
| opentofu  | latest   |

## Setup on a new machine

```sh
# 1. Install mise
brew install mise

# 2. Stow the module
cd ~/.dotfiles && ./install.sh mise

# 3. Install all configured tools
mise install
```

## Add or update a tool

```sh
# Add a tool globally
mise use --global python@3.12

# Update all tools
mise upgrade
```

Changes to `config.toml` are tracked in git.