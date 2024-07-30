eval $(/usr/local/bin/brew shellenv)

set -U fish_add_path /usr/local/bin 
# set fish_add_path /usr/local/opt/ruby/bin
set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings


set -Ux BAT_THEME "Catppuccin Mocha"
set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux EDITOR "nvim"
set -Ux VISUAL "code"
set -Ux LS_COLORS $(vivid generate catppuccin-mocha)
set -Ux XDG_CONFIG_HOME "$HOME/.config"

set -Ux fish_tmux_config $XDG_CONFIG_HOME/tmux/tmux.conf
set -Ux fish_tmux_default_session_name "asl"

# https://superuser.com/questions/874901/what-are-the-step-to-move-all-your-dotfiles-into-xdg-directories
#set -Ux VIMDOTDIR "$XDG_CONFIG_HOME/vim"
#set -Ux VIMINIT 'let $MYVIMRC="$VIMDOTDIR/vimrc" | source $MYVIMRC'

set -Ux nvm_default_version lts/iron

abbr tasl "tmux new -A -s asl"
abbr tvsc "tmux new -A -s vsc"
abbr cfgfish "$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
abbr cfgnvim "$EDITOR $XDG_CONFIG_HOME/nvim/init.vim"
abbr cfgtmux "$EDITOR $fish_tmux_config"
abbr srcfish "source $XDG_CONFIG_HOME/fish/config.fish"
abbr gco "git checkout"

alias ls="eza --icons"
alias l="eza --icons --long --git --header --all"
alias ll="eza --icons --long --git --header"
alias cat="bat"

eval "$(rbenv init -)"
fzf --fish | source
