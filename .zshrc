export EDITOR=$(which vim)

# source functions
fpath=( "$HOME/.config/zsh/funcs" "${fpath[@]}" )

# autoload custom functions
autoload -Uz dotfiles md ip killport pushup extract backup

# options
setopt prompt_subst     # allow prompt expansion
setopt completealiases  # alias completion
setopt extendedglob     # allow regex globbing
setopt nocaseglob       # case-insensitive globbing
setopt autocd           # better cd
setopt autopushd        # auto add to dir stack
setopt nobeep           # shut up
setopt numericglobsort  # sort numerically

# autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# source prompt, aliases, and plugins
source $HOME/.config/zsh/prompt
source $HOME/.config/zsh/aliases
source $HOME/.config/zsh/plugins
