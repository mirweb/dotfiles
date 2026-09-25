# Dotfiles project guidance

- The bootstrap checkout lives at `~/.local/share/mise/bootstrap-repo` and is linked as `~/.dotfiles`. Managed sources are in the repository root; their targets are declared under `[dotfiles]` in `mise.toml`.
- Before moving or deleting a source, check for ignored or untracked files (especially SSH keys and secrets). Copy or back up what must be kept, verify new links, and ask for explicit confirmation before deleting originals. Never recursively remove `~/.ssh` or a directory that may contain local data.
- Manage only the SSH config paths this repo owns, not the whole `~/.ssh` directory. Keep machine-specific secrets out of Git.
- When adding a managed file, add its target to `mise.toml`, run `mise dot apply --dry-run`, then apply after checking for conflicts. Avoid blanket `--force-dotfiles`.
- Add an Unreleased changelog entry for user-visible changes; don't require one for purely internal maintenance. Review staged changes for secrets before committing.
