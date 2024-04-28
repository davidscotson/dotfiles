set -gx EDITOR nvim

function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
    set fish_cursor_default block
# Set the insert mode cursor to a line
    set fish_cursor_insert line
# Set the replace mode cursor to an underscore
    set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
    set fish_cursor_visual block
end

fish_ssh_agent

fish_add_path   /opt/homebrew/sbin
fish_add_path   /opt/homebrew/bin
fish_add_path   --append --move /usr/local/sbin
fish_add_path   --append --move /usr/local/bin

# git
abbr -a -- ga 'git add' 
abbr -a -- gst 'git status' 
abbr -a -- gss 'git status --short'
abbr -a -- gds 'git diff --staged'
abbr -a -- gb 'git branch'
abbr -a -- gd 'git diff'
abbr -a -- gco 'git checkout'
abbr -a -- glol 'git log --oneline --no-abbrev-commit'
abbr -a -- yrr 'yarn run run'
abbr -a -- yrb 'yarn run build'
abbr -a -- gbv 'git branch --verbose'

# neovim
abbr -a -- vg "nvim '+Telescope live_grep'"

# Created by `pipx` on 2022-11-21 21:28:33
set PATH $PATH /Users/davidscotson/.local/bin
~/.local/bin/mise activate fish | source
