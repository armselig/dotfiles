if type -q /usr/local/bin/brew
    eval "$(/usr/local/bin/brew shellenv)"
end

set OSTYPE "$(uname)"
set -q XDG_CONFIG_HOME || set -U XDG_CONFIG_HOME "$HOME/.config"
set -x NVM_DIR "$XDG_CONFIG_HOME/nvm"

set -U fish_add_path /usr/local/bin ~/.local/bin
set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings

set -Ux BAT_THEME "Catppuccin Mocha"
set -Ux EDITOR "vim"
#set -Ux LS_COLORS '(vivid generate catppuccin-mocha)'
# set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux TERM alacritty
set -Ux VISUAL "code"

set -x NVM_DIR "~/.nvm"

# budimanjojo/tmux.fish
set -Ux fish_tmux_autostart false
set -Ux fish_tmux_config $XDG_CONFIG_HOME/tmux/tmux.conf
set -Ux fish_tmux_default_session_name "asl"

# https://superuser.com/questions/874901/what-are-the-step-to-move-all-your-dotfiles-into-xdg-directories
#set -Ux VIMDOTDIR "$XDG_CONFIG_HOME/vim"
#set -Ux VIMINIT 'let $MYVIMRC="$VIMDOTDIR/vimrc" | source $MYVIMRC'

# jorgebucaran/nvm.fish
#set -Ux nvm_default_version "lts/iron"
#set nvm_current_version # reset

abbr tasl "tmux new -A -s asl"
abbr cfish "$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
abbr cnvim "$EDITOR $XDG_CONFIG_HOME/nvim/init.lua"
abbr cvim "$EDITOR $HOME/.vimrc"
abbr ctmux "$EDITOR $fish_tmux_config"
abbr sfish "source $XDG_CONFIG_HOME/fish/config.fish"
abbr d5n "ssh d5n -t 'tmux new -As asl'"
abbr gco "git checkout"
abbr gcm --set-cursor "git commit -m \"%\"" 
abbr gpl "git pull"
abbr gps "git push"
abbr gf "git fetch"
abbr ga "git add"
abbr gs "git status"

if type -q eza
    alias ls="eza --icons"
    alias l="eza --icons --long --git --header --all"
    alias ll="eza --icons --long --git --header"
end

# if type -q batcat
#     alias bat="batcat"
# end

# if type -q bat
#     alias cat="bat"
# end

if type -q rbenv
    eval "$(rbenv init -)"
end

if test "$OSTYPE" = "Darwin"; and type -q fzf
    fzf --fish | source
end

# https://dev.to/fabientownsend/setup-node-and-nvm-with-fish-shell-5f3
function nvm
    bass source (brew --prefix nvm)/nvm.sh --on-use ';' nvm $argv
end
nvm use default --silent

