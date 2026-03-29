# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/mirweb/.cache/lm-studio/bin

set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_showstashstate yes
set -g __fish_git_prompt_showuntrackedfiles yes

mise activate fish | source
/opt/homebrew/bin/brew shellenv | source

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/mirweb/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
