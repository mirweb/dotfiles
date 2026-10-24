# Public vars are loaded automatically from conf.d/env.fish.
# Secrets are loaded automatically from conf.d/secrets.fish (not in repo, see secrets.fish.example).

# Editor
set -gx EDITOR vim

# XDG base dirs
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache

# Homebrew: Environment-Hints ausblenden (siehe `man brew`)
set -gx HOMEBREW_NO_ENV_HINTS 1

# mkcert: bestehende macOS-CA verwenden statt $XDG_DATA_HOME/mkcert
if test (uname) = Darwin
    set -gx CAROOT "$HOME/Library/Application Support/mkcert"
end
