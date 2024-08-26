if type -q /usr/local/bin/brew
    eval $(/usr/local/bin/brew shellenv)
end

set -q XDG_CONFIG_HOME || set -U XDG_CONFIG_HOME "$HOME/.config"

set -U fish_add_path /usr/local/bin 
set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings

set -Ux BAT_THEME "Catppuccin Mocha"
set -Ux EDITOR "nvim"
set -Ux LS_COLORS $(vivid generate catppuccin-mocha)
set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux TERM alacritty
set -Ux VISUAL "code"

set -x NVM_DIR "~/.nvm"

# budimanjojo/tmux.fish
set -Ux fish_tmux_autostart true
set -Ux fish_tmux_config $XDG_CONFIG_HOME/tmux/tmux.conf
set -Ux fish_tmux_default_session_name "asl"

# https://superuser.com/questions/874901/what-are-the-step-to-move-all-your-dotfiles-into-xdg-directories
#set -Ux VIMDOTDIR "$XDG_CONFIG_HOME/vim"
#set -Ux VIMINIT 'let $MYVIMRC="$VIMDOTDIR/vimrc" | source $MYVIMRC'

# jorgebucaran/nvm.fish
set -Ux nvm_default_version "lts/iron"

abbr tasl "tmux new -A -s asl"
abbr tvsc "tmux new -A -s vsc"
abbr cfgfish "$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
abbr cfgnvim "$EDITOR $XDG_CONFIG_HOME/nvim/init.vim"
abbr cfgtmux "$EDITOR $fish_tmux_config"
abbr srcfish "source $XDG_CONFIG_HOME/fish/config.fish"
abbr gco "git checkout"

if type -q ls
    alias ls="eza --icons"
    alias l="eza --icons --long --git --header --all"
    alias ll="eza --icons --long --git --header"
end

alias cat="bat"

if type -q rbenv
    eval "$(rbenv init -)"
end

if type -q fzf
    fzf --fish | source
end

