export BASH_SILENCE_DEPRECATION_WARNING=1

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# dircolors
if [ -e ~/.dircolors ]; then
  eval `dircolors -b ~/.dircolors`
fi

# Tab complete sudo commands
complete -cf sudo

# Fix vim colors inside tmux
if [ -n $TMUX ]; then
  alias vim="TERM=screen-256color vim"
fi

alias icat="kitty +kitten icat"
source /dev/stdin <<<"$(kitty + complete setup bash)"

alias vi=nvim
alias ls=exa

PS1="\u:\W > "

# Set default editor to vim
export EDITOR=nvim

# Created by `userpath` on 2021-02-21 14:12:09
export PATH="$PATH:/Users/davidscotson/.local/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:./node_modules/.bin"


export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"
alias kdlang='rg --glob="**/lang/en/*.php"'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
