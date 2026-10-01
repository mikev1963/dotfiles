# zsh plugin manager
source /opt/homebrew/opt/zinit/zinit.zsh

# super smart autocompletions
zinit ice wait"0" lucid depth=1 pick"deja.plugin.zsh"
zinit light Giammarco-Ferranti/deja

# syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Hermes Configuration
export HERMES_HOME="$HOME/.config/hermes"

# Startship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
