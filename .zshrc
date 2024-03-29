# set config paths
zconfig=$HOME/.config/zsh

# source config files
. $zconfig/aliases
. $zconfig/prompt

# options
setopt prompt_subst       # allow prompt expansion
setopt glob               # expand stuff to generate filenames
setopt extendedglob       # allow regex globbing
setopt nocaseglob         # case-insensitive globbing
setopt autocd             # better cd
setopt autopushd          # auto add to dir stack
setopt nobeep             # shut up
setopt numericglobsort    # sort numerically
setopt inc_append_history # Appends every command to history
setopt share_history      # Reloads history whenever it's used

# autocomplete
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# configure zsh function path
zfunc=$zconfig/zfunc
fpath=($zfunc $fpath)

# autoload custom functions
for func in $^zfunc/*(N-.:t); autoload -Uz $func

# source asdf
[ -s $(brew --prefix asdf)/libexec/asdf.sh ] && source $(brew --prefix asdf)/libexec/asdf.sh

# go
export GOPATH=$(asdf where golang)/packages
export GOROOT=$(asdf where golang)/go
export PATH="${PATH}:$(go env GOPATH)/bin"

# source plugins (must be last)
. $zconfig/plugins

