# Public environment variables — checked into the repo.
# For secrets, copy conf.d/secrets.fish.example → conf.d/secrets.fish and fill in values.

# Editor
set -gx EDITOR vim

# XDG base dirs
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache
