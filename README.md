# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Modules

| Module   | Files                                      |
|----------|--------------------------------------------|
| `zsh`    | `~/.zshrc`                                 |
| `vim`    | `~/.vimrc`                                 |
| `screen` | `~/.screenrc`                              |
| `ssh`    | `~/.ssh/config`, `~/.ssh/config.d/`        |
| `git`    | `~/.gitconfig`                             |

## Install

### Prerequisites

```sh
# macOS
brew install stow

# Debian/Ubuntu
apt install stow
```

### Setup on a new machine

```sh
git clone https://github.com/mirweb/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

To set zsh as default shell:

```sh
chsh -s $(which zsh)
```

## Usage

```sh
# Stow all modules
./install.sh

# Stow specific modules only
./install.sh zsh vim

# Update (restow) all modules after a git pull
./install.sh --update

# Update a specific module
./install.sh --update zsh

# Remove symlinks for a module
./install.sh --delete ssh
```

## Add a new module

Create a folder named after the module. Mirror the target directory structure using dotfile names (`.`-prefix):

```
~/.dotfiles/
  myapp/
    .config/
      myapp/
        config.toml   →  symlinked to ~/.config/myapp/config.toml
```

Then stow it:

```sh
./install.sh myapp
```
