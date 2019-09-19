# Make sure zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug && \
        source ~/.zplug/init.zsh && \
        zplug update
else
    source ~/.zplug/init.zsh
fi

## begin zplug ##
zplug "zplug/zplug"
# Theme
zplug "dracula/zsh", as:theme

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"

# oh-my-zsh features
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh

# scripts
zplug "so-fancy/diff-so-fancy", as:command, use:"third_party/build_fatpack/diff-so-fancy"
zplug "denilsonsa/prettyping", as:command, use:"prettyping"

# These need modifying on non-x86 environments.
zplug "sharkdp/bat", as:command, from:gh-r, use:"*x86_64*linux-gnu*"
zplug "dbrgn/tealdeer", as:command, from:gh-r, use:"*x86_64*", rename-to:tldr


# Install plugins that are not installed
if ! zplug check --verbose; then
     zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load
## end zplug ##

# Misc zsh config
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# Colourised ls
alias ls="ls --color"

# Highlighting rules
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=240

# dircolors
if [[ -a $HOME/.dircolors ]]; then
    eval $(dircolors -b $HOME/.dircolors)
fi

# most instead of less
if type most >/dev/null 2>&1; then
    export MANPAGER="most -s"
fi

if type vim >/dev/null 2>&1; then
    # use vim as editior
    export EDITOR="vim --"
fi

# Go
if type go >/dev/null 2>&1; then
    export GOPATH=~/go
    export PATH=$PATH:$GOPATH/bin
fi

# Node
if type n >/dev/null 2>&1; then
    export N_PREFIX=$HOME/.local
    export PATH=$N_PREFIX/bin:$PATH
fi

# Cargo
if type cargo >/dev/null 2>&1; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PROMPT="%{$fg_bold[magenta]%}(%M) ${PROMPT}"
fi

# Machine specific
if [ -f ~/.zsh_machine ]; then
    . ~/.zsh_machine
fi

alias gs="git status"
alias gd="git diff"

# Wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# Put any PATH and/or LD_LIBRARY_PATH modifications here.
# e.g. PATH="$PATH:$HOME/flang/bin"
# e.g. LD_LIBRARY_PATH="$PATH:$HOME/flang/lib"

export PATH
export LD_LIBRARY_PATH
