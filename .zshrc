# GO path
export GOPATH="$HOME/go"
export GOROOT="$(brew --prefix golang)/libexec"

# Path
export PATH=$GOPATH:/usr/local/bin:$PATH
export FPATH=/usr/local/share/zsh-completions:/usr/local/share/zsh/functions:$FPATH

# History in cache
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Set whale prompt
#export PROMPT="🐳 "

# Powerline
# The list of segments shown on the left
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  # =========================[ Line #1 ]=========================
  #os_icon                 # os identifier
  dir                     # current directory
  vcs                     # git status
  # =========================[ Line #2 ]=========================
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  # =========================[ Line #1 ]=========================
  status                  # exit code of the last command
  command_execution_time  # duration of the last commend
  background_jobs         # presence of background jobs
  pyenv                   # python environment
  go_version              # go version
  root_indicator          # root prompt
  time                    # current time
  # =========================[ Line #1 ]=========================
)
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
typeset -g POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S | %d.%m.%y}"

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad;

# Autotab completion
ZSH_DISABLE_COMPFIX="true"
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors 'exfxcxdxbxegedabagacad'

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

setopt autocd

# ALIAS
alias ls="exa"

# bare git repo alias for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'


# Load zsh-syntax-highlighting
source ~/scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Suggest aliases for commands
source ~/scripts/zsh-you-should-use/you-should-use.plugin.zsh

# Search repos for programs that can't be found
source ~/scripts/command-not-found/command-not-found.plugin.zsh

# auto suggestions
source ~/scripts/zsh-autosuggestions/zsh-autosuggestions.zsh

# Powerline9k
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

# pfetch
$HOME/scripts/pfetch

test -e /Users/mikev1963/.iterm2_shell_integration.zsh && source /Users/mikev1963/.iterm2_shell_integration.zsh || true

