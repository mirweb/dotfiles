# fish module

Manages `~/.config/fish/config.fish` via GNU Stow.

## What is NOT tracked (gitignored)

`fish_variables` is excluded from git because it contains:
- Universal variables set by fish and tools (machine-specific)
- **Secrets** like API tokens — never commit this file

## Required variables

Set these once on each machine with `set -Ux` (universal, persists across sessions):

### GitLab

```fish
set -Ux GITLAB_TOKEN "glpat-xxxxxxxxxxxxxxxxxxxx"
set -Ux GITLAB_PROJECT_ID "12345678"
```

### Other secrets / tokens

```fish
set -Ux MY_API_KEY "..."
```

Universal variables are stored in `~/.config/fish/fish_variables` automatically by fish.
You do not need to add them to `config.fish`.

## Setup on a new machine

```sh
# 1. Stow the module
cd ~/.dotfiles && ./install.sh fish

# 2. Set required universal variables (see above)
set -Ux GITLAB_TOKEN "your-token-here"
set -Ux GITLAB_PROJECT_ID "your-project-id"
```