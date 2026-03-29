# fish module

Manages `~/.config/fish/` via GNU Stow.

## Files

| Datei | Zweck | Im Repo |
|---|---|---|
| `conf.d/env.fish` | Öffentliche Umgebungsvariablen (`set -gx`) | ja |
| `conf.d/secrets.fish.example` | Template für lokale Secrets | ja |
| `conf.d/secrets.fish` | Lokale Secrets (nie committen) | nein |
| `fish_variables` | Universelle Variablen (machine-specific) | nein |
| `config.fish` | Shell-Init, PATH, Tool-Integration | ja |

## Setup auf einer neuen Maschine

```sh
# 1. Modul einrichten
cd ~/.dotfiles && ./install.sh fish

# 2. Secrets anlegen
cp ~/.config/fish/conf.d/secrets.fish.example ~/.config/fish/conf.d/secrets.fish

# 3. Secrets eintragen und laden
$EDITOR ~/.config/fish/conf.d/secrets.fish
source ~/.config/fish/conf.d/secrets.fish
```

## Variablen hinzufügen

**Öffentliche Vars** (z.B. `EDITOR`, Tool-Pfade) → `conf.d/env.fish` mit `set -gx`:

```fish
set -gx MY_VAR "value"
```

**Secrets** (Tokens, API-Keys) → `conf.d/secrets.fish` (nur lokal, nicht im Repo), Beispiel in `secrets.fish.example` ergänzen:

```fish
set -gx MY_SECRET "value"
```
