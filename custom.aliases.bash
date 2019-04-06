alias ls="ls -hp"
alias ll='ls -halp'
alias grep="grep"
alias egrep="egrep"
alias gc="git commit -S -v"
alias gcm="git commit -S -v -m"
alias sudo="sudo -E"

# Commit and push everything
gitdone() { git add -A; git commit -S -v -m "$1"; git push; }

# Use ssht to open tmux automatically for ssh sessions
function ssht(){
  ssh $* -t 'tmux a || tmux || /bin/bash'
}
