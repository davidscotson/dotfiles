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
alias nvimdiff'=nvim -d'
alias ls=exa

PS1="\u:\W > "

# Set default editor to vim
export EDITOR=nvim

# Created by `userpath` on 2021-02-21 14:12:09
export PATH="$PATH:/Users/davidscotson/.local/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:./node_modules/.bin"


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
alias pip=/usr/local/bin/pip3

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"
alias kdlang='rg --glob="**/lang/en/*.php"'


alias luamake=/Users/davidscotson/github/sumneko/lua-language-server/3rd/luamake/luamake

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
