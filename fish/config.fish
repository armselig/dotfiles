# --- Environment Setup ---

# Homebrew setup for macOS and Linuxbrew
if type -q brew
    eval (brew shellenv)
end

# XDG Base Directory Specification
set -q XDG_CONFIG_HOME || set -U XDG_CONFIG_HOME "$HOME/.config"

# Add common binaries to path (universal variable for persistence)
set -U fish_add_path /usr/local/bin ~/.local/bin

# Fish shell specific settings (universal variables)
set -U fish_greeting # No greeting
set -U fish_key_bindings fish_vi_key_bindings

# Exported environment variables
set -gx OSTYPE "$(uname)"
set -Ux EDITOR "vi" # Or "vim"
# set -Ux VISUAL "code" # Uncomment if you use VSCode as your primary graphical editor
set -Ux TERM alacritty # Your terminal emulator

# MANPAGER setup with bat/batcat fallback
if type -q bat || type -q batcat
    set -Ux MANPAGER "sh -c 'col -bx | (bat -l man -p --paging=always || batcat -l man -p --paging=always || cat)'"
    set -Ux BAT_THEME "Catppuccin Mocha" # Set bat theme globally
else
    set -Ux MANPAGER "less -R" # Fallback
end

# Optional: LS_COLORS with vivid (if not using lsd's built-in colors)
# if type -q vivid
#     set -Ux LS_COLORS (vivid generate catppuccin-mocha)
# end

# --- Plugin/Tool Integrations ---

# NVM (Node Version Manager) setup using bass
# Requires 'bass' to be installed (e.g., brew install bass or fisher install edc/bass)
set -gx NVM_DIR "$XDG_CONFIG_HOME/nvm" # Or "~/.nvm" if you prefer
function nvm
    set -l nvm_script (brew --prefix nvm)/nvm.sh
    if test -f $nvm_script
        bass source $nvm_script --no-use ';' nvm $argv
    else
        echo "Error: NVM script not found at $nvm_script"
        return 1
    end
end
nvm use default --silent # Load default Node.js version on startup

# pnpm setup
set -gx PNPM_HOME "/Users/henneuma/Library/pnpm" # Adjust if pnpm is installed elsewhere
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# rbenv setup
if type -q rbenv
    eval (rbenv init -)
end

# fzf integration
if type -q fzf
    fzf --fish | source
end

# budimanjojo/tmux.fish configuration
set -Ux fish_tmux_autostart false
set -Ux fish_tmux_config "$XDG_CONFIG_HOME/tmux/tmux.conf"
set -Ux fish_tmux_default_session_name "asl"

# --- Aliases (Abbreviations) ---

# General file system aliases
abbr l "ls"
abbr ll "ls -l"
abbr lal "ls -al"

# Tmux aliases
abbr tasl "tmux new -A -s asl"
abbr ta "tmux attach"

# Dotfiles configuration aliases
abbr cfish "$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
abbr cnvim "$EDITOR $XDG_CONFIG_HOME/nvim/init.lua"
abbr cvim "$EDITOR $HOME/.vimrc"
abbr ctmux "$EDITOR $fish_tmux_config"
abbr csway "$EDITOR $XDG_CONFIG_HOME/sway/config"
abbr cdot "$EDITOR $HOME/.dotfiles/install.conf.yaml"
abbr sfish "source $XDG_CONFIG_HOME/fish/config.fish"

# SSH aliases
abbr d5n "ssh d5n -t 'tmux new -As asl'"

# Git aliases
abbr gbo "git branch -u origin/"
abbr gco "git checkout"
abbr gca "git commit --amend"
abbr gcm --set-cursor "git commit -m \"%\""
abbr glo "git log --oneline"
abbr glg "git log --graph --decorate --all"
abbr gpl "git pull"
abbr gps "git push"
abbr gpso "git push -u origin HEAD"
abbr gf "git fetch"
abbr ga "git add"
abbr gs "git status"

# System aliases
abbr susp "systemctl suspend"

# --- Conditional Aliases / Fallbacks ---

# Alias 'vi' to 'vim' if vim is available
if type -q vim
    alias vi="vim"
end

if type -q nvim
    alias vim="nvim"
end

# Alias 'ls' to 'lsd' if lsd is available
if type -q lsd
    alias ls="lsd"
end

# Alias 'bat' to 'batcat' on Debian/Ubuntu systems
if type -q batcat
    alias bat="batcat"
end

# Alias 'cat' to 'bat' if bat or batcat is available
if type -q bat || type -q batcat
    alias cat="bat"
end
