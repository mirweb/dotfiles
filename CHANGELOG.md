# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [1.0.0] - 2026-03-29

### Added
- `install.sh` script based on GNU Stow with support for all/single module stow, restow, and delete
- Stow module structure: `zsh`, `vim`, `screen`, `ssh`, `git`

### Removed
- dotbot git submodule and all related config files (`install`, `install.conf.yaml`, `bootstrap.conf.yaml`, `install.ps1`)
- Flat `home/` directory structure

### Changed
- Migrated `~/.gitconfig` to stow-managed `git/.gitconfig` module
- Updated README with stow-based setup and usage instructions

## [1.0.0-pre] - 2026-03-29

### Added
- OCI k3s SSH host entry (`~/.ssh/config.d/home`)
- SSH config includes for Colima and OrbStack
- LM Studio CLI PATH export (`~/.cache/lm-studio/bin`)
- Rancher Desktop PATH export (`~/.rd/bin`)
- Angular CLI autocompletion in zshrc
- Native zsh configuration: `compinit`, `vcs_info` git prompt, history options, keybindings
- Git aliases (`gst`, `gco`, `glog`, `gp`, `gl`, etc.)
- rsync helper aliases (`rsync-copy`, `rsync-move`, `rsync-update`, `rsync-sync`)
- `cpv` function (cp with progress via rsync)
- ESC+ESC keybinding to prepend `sudo` to current command
- Case-insensitive tab completion

### Removed
- oh-my-zsh git submodule and all dependencies
- oh-my-zsh plugins: `git`, `gradle`, `grails`, `screen`, `cp`, `rsync`, `docker`, `sudo`, `common-aliases`, `macos`

### Fixed
- Duplicate Angular CLI autocompletion entries in zshrc
