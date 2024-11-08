if type -q /usr/local/bin/brew
    eval "$(/usr/local/bin/brew shellenv)"
end

if type -q /home/linuxbrew/.linuxbrew/bin/brew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

set OSTYPE "$(uname)"
set -q XDG_CONFIG_HOME || set -U XDG_CONFIG_HOME "$HOME/.config"
set -U fish_add_path /usr/local/bin ~/.local/bin
set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings
set -Ux EDITOR "vi"
#set -Ux LS_COLORS '(vivid generate catppuccin-mocha)'
set -Ux TERM alacritty
# set -Ux VISUAL "code"
set -x NVM_DIR "$XDG_CONFIG_HOME/nvm"
# set -x NVM_DIR "~/.nvm"$
set -gx MANPAGER "sh -c 'col -bx | (command -v bat >/dev/null && bat -l man -p || command -v batcat >/dev/null && batcat -l man -p || cat)'"

# budimanjojo/tmux.fish
set -Ux fish_tmux_autostart false
set -Ux fish_tmux_config $XDG_CONFIG_HOME/tmux/tmux.conf
set -Ux fish_tmux_default_session_name "asl"

abbr l "ls"
abbr ll "ls -l"
abbr lal "ls -al"
abbr tasl "tmux new -A -s asl"
abbr cfish "$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
abbr cnvim "$EDITOR $XDG_CONFIG_HOME/nvim/init.lua"
abbr cvim "$EDITOR $HOME/.vimrc"
abbr ctmux "$EDITOR $fish_tmux_config"
abbr csway "$EDITOR $XDG_CONFIG_HOME/sway/config"
abbr cdot "$EDITOR $HOME/.dotfiles/install.conf.yaml"
abbr sfish "source $XDG_CONFIG_HOME/fish/config.fish"
abbr d5n "ssh d5n -t 'tmux new -As asl'"
abbr gco "git checkout"
abbr gcm --set-cursor "git commit -m \"%\"" 
abbr gpl "git pull"
abbr gps "git push"
abbr gf "git fetch"
abbr ga "git add"
abbr gs "git status"
abbr susp "systemctl suspend"

if type -q vim
    alias vi="vim"
end

if type -q lsd
    alias ls="lsd"
end

if type -q batcat
    alias bat="batcat"
end

if type -q bat
    # set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -Ux BAT_THEME "Catppuccin Mocha"
    alias cat="bat"
end

if type -q rbenv
    eval "$(rbenv init -)"
end

if type -q fzf
    fzf --fish | source
end

# https://dev.to/fabientownsend/setup-node-and-nvm-with-fish-shell-5f3
function nvm
    if type -q (brew --prefix nvm)/nvm.sh
        bass source (brew --prefix nvm)/nvm.sh --on-use ';' nvm $argv
    end
end
nvm use default --silent

