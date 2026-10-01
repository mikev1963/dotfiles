# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load omarchy-zsh configuration
if [[ -d ~/.local/share/omarchy/default/zsh/conf.d ]]; then
  for config in ~/.local/share/omarchy/default/zsh/conf.d/*.zsh; do
    [[ -f "$config" ]] && source "$config"
  done
fi

# Load omarchy-zsh functions and aliases
if [[ -d ~/.local/share/omarchy/default/zsh/functions ]]; then
  for func in ~/.local/share/omarchy/default/zsh/functions/*.zsh; do
    [[ -f "$func" ]] && source "$func"
  done
fi

# Add your own customizations below

