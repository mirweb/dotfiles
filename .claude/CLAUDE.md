# Dotfiles Project Rules

## Never delete files without explicit confirmation

When restructuring, migrating, or moving files:

1. **Copy first, delete never** — always copy files to the new location and verify they arrived before touching the source.
2. **Check for untracked secrets** — files like SSH keys, tokens, and credentials are excluded from git via `.gitignore`. They exist only on disk. Deleting a directory removes them permanently with no recovery (unless Time Machine is available).
3. **Verify symlinks before removing originals** — when switching symlink targets (e.g. dotbot → stow), confirm the new symlink resolves correctly before removing the old one.
4. **Never `rm -rf` a directory that was previously a symlink target** — it may contain user data (SSH keys, etc.) that is not in git.
5. **When in doubt, ask** — if unsure whether a file is safe to remove, ask the user first.

## mise dotfile structure

Managed sources live in the bootstrap repository root and are explicitly mapped
in `.config/mise/config.toml`:

```
.config/fish/config.fish  →  ~/.config/fish/config.fish
.ssh/config                →  ~/.ssh/config
.zshrc                     →  ~/.zshrc
```

The bootstrap checkout lives at `~/.local/share/mise/bootstrap-repo` and is
linked to `~/.dotfiles`. Never manage `~/.ssh` as a whole directory; map only
the specific configuration paths that the repository owns.

## Adding a managed file checklist

- [ ] Copy (not move) the file into the mirrored repository path
- [ ] Verify content matches the original
- [ ] Add sensitive/dynamic files to `.gitignore`
- [ ] Add an explicit `[dotfiles]` mapping in `.config/mise/config.toml`
- [ ] Run `mise bootstrap dotfiles apply --dry-run` and verify the proposed links
- [ ] Update `CHANGELOG.md`
- [ ] Only then remove originals (if applicable)
