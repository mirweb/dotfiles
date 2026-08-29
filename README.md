# dotfiles

Managed with [mise bootstrap](https://mise.jdx.dev/bootstrap.html).

The bootstrap repository lives at `~/.local/share/mise/bootstrap-repo` and is
linked to `~/.dotfiles` for convenient access. The configuration supports macOS
and Debian/Ubuntu, uses Fish as the login shell, and leaves desktop integrations
such as OrbStack, Rancher Desktop, and LM Studio optional.

## Managed files

| Target | Source |
|---|---|
| `~/.dotfiles` | mise bootstrap checkout |
| `~/.config/fish/` | `.config/fish/` |
| `~/.config/mise/config.toml` | `.config/mise/config.toml` |
| `~/.gitconfig` | `.gitconfig` |
| `~/.screenrc` | `.screenrc` |
| `~/.ssh/config`, `~/.ssh/config.d/` | `.ssh/config`, `.ssh/config.d/` |
| `~/.vimrc` | `.vimrc` |
| `~/.zshrc` | `.zshrc` |

## Install

Install [mise](https://mise.jdx.dev/getting-started.html) first, then bootstrap
the machine from this repository:

```sh
git clone git@github.com:mirweb/dotfiles.git ~/.local/share/mise/bootstrap-repo
mise trust ~/.local/share/mise/bootstrap-repo/.config/mise/config.toml
mise -C ~/.local/share/mise/bootstrap-repo bootstrap --yes
```

Preview changes before applying them:

```sh
mise -C ~/.local/share/mise/bootstrap-repo bootstrap --dry-run
```

`mise bootstrap` installs declared host packages, links the managed files,
installs mise tools, and configures Fish as the login shell. It prompts before
any required privilege escalation.

## Updates

After the initial bootstrap, `~/.dotfiles` and the global mise configuration
are linked. Update and converge from the checkout:

```sh
cd ~/.dotfiles
git pull --ff-only
mise bootstrap --update --yes
```

## Managing changes

Managed files are symlinks. Edit their source in `~/.dotfiles`; the live target
updates immediately. After adding a new file, add its target to
`.config/mise/config.toml`, then preview and apply the new link:

```sh
cd ~/.dotfiles
mise bootstrap dotfiles apply --dry-run
mise bootstrap dotfiles apply --yes
```

To change a managed tool, update `[tools]` in `.config/mise/config.toml` and
run `mise install`. To add a host package, update `[bootstrap.packages]` and
run `mise bootstrap packages apply --yes`.

## Existing Stow installation

The previous Stow modules and `install.sh` are retained during migration so
existing local files and ignored secrets are never removed automatically. Run a
bootstrap dry-run on an existing machine and resolve reported conflicts before
switching to mise-managed links. In particular, never use `--force-dotfiles`
against `~/.ssh` or an existing `~/.dotfiles` checkout without a verified backup.
