# dotfiles

Dotfiles and tools for macOS and Debian/Ubuntu, managed with
[mise bootstrap](https://mise.jdx.dev/bootstrap.html). Fish is the login shell;
desktop integrations are optional. `mise.toml` defines the shared setup and
`mise.*.toml` selects the platform-specific login shell.

## Install

Install [mise](https://mise.jdx.dev/getting-started.html) and Git, review this
repository, then run:

```sh
mise bootstrap --from git@github.com:mirweb/dotfiles.git
```

`--from` clones to `~/.local/share/mise/bootstrap-repo` and links it as
`~/.dotfiles`. It installs Fish, mise tools, and the declared dotfiles; open a
new login session if your shell changes.

## Update

With a clean checkout, fast-forward and reapply the setup:

```sh
mise bootstrap --from git@github.com:mirweb/dotfiles.git --update
```

`--update` will not overwrite local checkout changes. Check managed links with
`mise dot status`. This repo uses Git, not mise's optional dotfile history sync.

## Make changes

Edit symlinked files in `~/.dotfiles`. For a new file, add its target to
`[dotfiles]` in `mise.toml`, then preview and apply:

```sh
cd ~/.dotfiles
mise dot apply --dry-run
mise dot apply
```

For tools, edit `[tools]` and run `mise install`. For host packages, edit
`[bootstrap.packages]` and run `mise bootstrap packages apply`. On mise
versions without global `auto_env`, use `-E` to select a platform config for
commands outside this checkout (for example,
`mise -E macos-arm64 bootstrap user status`).

Commit local edits from the checkout. Review what you stage, especially new
files that could contain secrets:

```sh
cd ~/.dotfiles
git status --short
git add -A
git diff --cached
git commit -m "feat(dotfiles): describe your change"
```

`git commit` saves changes locally; `git push` shares them with the remote.
Commit or otherwise resolve local changes before using `--from --update`.

## Migrating from Stow

See the [Stow-to-mise migration runbook](docs/runbooks/migrate-from-stow.md)
before updating a machine that still uses the old Stow modules.
