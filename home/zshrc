# === Completion ===
# Brew completions (macOS)
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # case-insensitive completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# === History ===
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_VERIFY  # show expanded history command before running

# === Options ===
setopt AUTO_CD
setopt NO_CORRECT          # disable autocorrection
setopt PROMPT_SUBST
setopt INTERACTIVE_COMMENTS

# === Key bindings (emacs-style) ===
bindkey -e
bindkey '^[[A' history-beginning-search-backward  # up arrow: history search
bindkey '^[[B' history-beginning-search-forward   # down arrow: history search
bindkey '^[[H' beginning-of-line   # Home
bindkey '^[[F' end-of-line         # End
bindkey '^[[3~' delete-char        # Delete

# ESC ESC -> prepend sudo
sudo-command-line() {
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER == sudo\ * ]]; then
    LBUFFER="${LBUFFER#sudo }"
  else
    LBUFFER="sudo $LBUFFER"
  fi
}
zle -N sudo-command-line
bindkey '^[^[' sudo-command-line

# === Prompt (with git info via vcs_info) ===
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' (%F{yellow}%b%f)'
zstyle ':vcs_info:git:*' actionformats ' (%F{yellow}%b%f|%F{red}%a%f)'

precmd() { vcs_info }

PROMPT='%(?..%F{red}[%?]%f )%F{green}%n@%m%f %F{blue}%~%f${vcs_info_msg_0_} %# '

# === Git aliases ===
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gp='git push'
alias gl='git pull'
alias gst='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias glog='git log --oneline --decorate --graph'
alias gstash='git stash'

# === Common aliases ===
alias l='ls -lFh'
alias la='ls -lAFh'
alias ll='ls -lFh'
alias md='mkdir -p'
alias rd='rmdir'
alias grep='grep --color=auto'

# rsync helpers (replacing oh-my-zsh rsync plugin)
alias rsync-copy='rsync -avz --progress -h'
alias rsync-move='rsync -avz --progress -h --remove-source-files'
alias rsync-update='rsync -avzu --progress -h'
alias rsync-sync='rsync -avzu --delete --progress -h'

# cp with progress via rsync
cpv() { rsync -pogbr --backup-dir=/tmp/rsync -e /dev/null --progress "$@" }

# === User aliases ===
alias vi='vim'
alias o='xdg-open'
alias ansible-playbook='ansible-playbook --vault-password-file ~/.ansible_vault_pw'

# === 1Password SSH agent ===
if [[ -a ~/.1password/agent.sock ]]; then
  export SSH_AUTH_SOCK=~/.1password/agent.sock
fi

# === PATH exports ===
export PATH="/Users/mirweb/.rd/bin:$PATH"
export PATH="$PATH:/Users/mirweb/.cache/lm-studio/bin"

# === Angular CLI autocompletion ===
if command -v ng &>/dev/null; then
  source <(ng completion script)
fi
