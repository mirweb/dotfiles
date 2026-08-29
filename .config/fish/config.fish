# Public vars are loaded automatically from conf.d/env.fish.
# Secrets are loaded automatically from conf.d/secrets.fish (not in repo, see secrets.fish.example).

if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
else if type -q brew
    brew shellenv | source
end

if type -q mise
    mise activate fish | source
end

set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_showstashstate yes
set -g __fish_git_prompt_showuntrackedfiles yes

if test -d "$HOME/.cache/lm-studio/bin"
    set -gx PATH $PATH "$HOME/.cache/lm-studio/bin"
end

if test -d "$HOME/.rd/bin"
    set --export --prepend PATH "$HOME/.rd/bin"
end

if test -f "$HOME/.orbstack/shell/init2.fish"
    source "$HOME/.orbstack/shell/init2.fish"
end
