# Dotfiles Project Rules

## Never delete files without explicit confirmation

When restructuring, migrating, or moving files:

1. **Copy first, delete never** — always copy files to the new location and verify they arrived before touching the source.
2. **Check for untracked secrets** — files like SSH keys, tokens, and credentials are excluded from git via `.gitignore`. They exist only on disk. Deleting a directory removes them permanently with no recovery (unless Time Machine is available).
3. **Verify symlinks before removing originals** — when switching symlink targets (e.g. dotbot → stow), confirm the new symlink resolves correctly before removing the old one.
4. **Never `rm -rf` a directory that was previously a symlink target** — it may contain user data (SSH keys, etc.) that is not in git.
5. **When in doubt, ask** — if unsure whether a file is safe to remove, ask the user first.

## Stow module structure

Each tool is a separate stow module under `~/.dotfiles/<module>/`.
The directory tree inside mirrors the home directory with dotfile names:

```
fish/.config/fish/config.fish  →  ~/.config/fish/config.fish
ssh/.ssh/config                →  ~/.ssh/config
zsh/.zshrc                     →  ~/.zshrc
```

## Adding a new module checklist

- [ ] Create `<module>/` directory mirroring target paths
- [ ] Copy (not move) files into the module
- [ ] Verify content matches the original
- [ ] Add sensitive/dynamic files to `.gitignore`
- [ ] Run `./install.sh <module>` and verify symlinks
- [ ] Add module to the `MODULES` list in `install.sh`
- [ ] Update `CHANGELOG.md`
- [ ] Only then remove originals (if applicable)