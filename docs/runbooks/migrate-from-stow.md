# Migrate an existing Stow installation to mise

Use this runbook for a machine whose dotfiles are still linked from the old
GNU Stow modules. For a new machine, follow the [main installation guide](../../README.md#install)
instead; `mise bootstrap --from` clones the repository automatically.

The Stow modules and `install.sh` have been removed from this repository. The
active sources are the root-level files and `.config/`, deployed by `mise.toml`.
Do not delete the old checkout or change links until you have checked for local
files that are not in Git, especially secrets and SSH keys.

## Before switching

1. Back up the existing checkout and local configuration, including ignored
   secrets. Check where `~/.dotfiles`, `~/.config/fish`, and `~/.ssh` point, and
   keep any local files in those directories. The repo does not manage SSH keys
   or the entire `~/.ssh` directory.
2. Install mise and Git. Review the new `mise.toml` and the platform-specific
   `mise.*.toml` for this machine.
3. If your old checkout already occupies
   `~/.local/share/mise/bootstrap-repo`, make sure its origin is
   `git@github.com:mirweb/dotfiles.git` and its worktree is clean before
   updating it. Otherwise, `--from` creates a separate checkout there; an
   existing `~/.dotfiles` link to the old checkout may conflict.

## Preview and apply

Once the new version is available in the bootstrap checkout, preview the
proposed changes. If the checkout does not exist yet, clone it to
`~/.local/share/mise/bootstrap-repo` first; a dry-run does not clone or update
it. If it already exists at an older revision, back up the
old link targets before running `git pull --ff-only` in that checkout: pulling
the migration commit removes the Stow source files and may temporarily leave
old Stow links dangling.

```sh
mise bootstrap --from git@github.com:mirweb/dotfiles.git --dry-run
```

Inspect every conflict. In particular, check links under `~/.ssh` and
`~/.config/fish` before replacing them. If Stow still owns a link, remove or
repoint that *specific link* only after backing up its target; keep unmanaged
neighbors and local secrets. Do not apply `--force-dotfiles` to all targets or
delete the old checkout just to make the dry-run pass.

When the plan is safe, apply and verify:

```sh
mise bootstrap --from git@github.com:mirweb/dotfiles.git
mise dot status --missing
mise bootstrap status --missing
```

Start a new login session if mise changes your login shell. Keep the old
checkout and backups until the new symlinks and shell configuration have been
verified. Future updates can use `mise bootstrap --from git@github.com:mirweb/dotfiles.git --update`
from a clean checkout.
