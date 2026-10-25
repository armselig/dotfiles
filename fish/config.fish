# --- Environment Setup ---

# Used for OS-specific branches below (Darwin, Linux, ...)
set -l os (uname)

# Homebrew setup for macOS (Apple Silicon, Intel) and Linuxbrew.
# Probes the install locations directly, since brew is not on PATH before this ran.
for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew ~/.linuxbrew/bin/brew
    if test -x $brew_bin
        $brew_bin shellenv fish | source
        break
    end
end

# XDG Base Directory Specification
# Always (re-)exported, so a non-exported universal variable left behind by an
# older version of this config cannot hide it from child processes.
if set -q XDG_CONFIG_HOME
    set -gx XDG_CONFIG_HOME $XDG_CONFIG_HOME
else
    set -gx XDG_CONFIG_HOME "$HOME/.config"
end

# Add common binaries to path
fish_add_path /usr/local/bin ~/.local/bin

# Exported environment variables
# Prefer the most capable editor that is installed
set -gx EDITOR vi
for editor in nvim vim
    if command -q $editor
        set -gx EDITOR $editor
        break
    end
end
# set -gx VISUAL "code" # Uncomment if you use VSCode as your primary graphical editor
# ollama
set -gx OLLAMA_API_BASE http://127.0.0.1:11434
set -gx OLLAMA_CONTEXT_LENGTH 65536

# MANPAGER setup with bat (named batcat on Debian/Ubuntu)
set -l bat_bin
for candidate in bat batcat
    if command -q $candidate
        set bat_bin $candidate
        break
    end
end
if set -q bat_bin[1] && command -q col
    set -gx MANPAGER "sh -c 'col -bx | $bat_bin -l man -p --paging=always'"
    set -gx BAT_THEME "Catppuccin Mocha" # Set bat theme globally
else
    set -gx MANPAGER "less -R" # Fallback
end

# Optional: LS_COLORS with vivid (if not using lsd's built-in colors)
# if type -q vivid
#     set -gx LS_COLORS (vivid generate catppuccin-mocha)
# end

# --- Plugin/Tool Integrations ---

# NVM (Node Version Manager) setup using bass
# Requires 'bass' to be installed (e.g., brew install bass or fisher install edc/bass)
set -gx NVM_DIR "$XDG_CONFIG_HOME/nvm" # Or "~/.nvm" if you prefer
function nvm --description "Run nvm through bass, loading nvm.sh only when needed"
    set -l nvm_script
    for candidate in $NVM_DIR/nvm.sh $HOMEBREW_PREFIX/opt/nvm/nvm.sh
        if test -f $candidate
            set nvm_script $candidate
            break
        end
    end
    if not set -q nvm_script[1]
        echo "Error: nvm.sh not found in $NVM_DIR or the Homebrew prefix" >&2
        return 1
    end
    if not type -q bass
        echo "Error: 'bass' is required to run nvm (fisher install edc/bass)" >&2
        return 1
    end
    bass source $nvm_script --no-use ';' nvm $argv
end

# Puts an already installed node version on PATH without starting bash/python,
# which keeps shell startup and directory changes fast.
# Accepts what nvm accepts for installed versions: aliases (default, lts/*, node)
# and full or partial versions (24, 24.14, v24.14.1). Returns 1 if nothing matches.
function __nvm_activate_installed --argument-names requested --description "Activate an installed nvm node version"
    set -l versions_dir $NVM_DIR/versions/node
    set -l name $requested

    # Follow nvm alias files, e.g. default -> lts/krypton -> v24.21.0
    for hop in 1 2 3 4 5
        test -f "$NVM_DIR/alias/$name" || break
        set name (string trim <"$NVM_DIR/alias/$name")[1]
    end
    test -n "$name" || return 1

    set -l prefix (string replace -r '^v' '' -- $name)
    switch $name
        case node stable
            set prefix ''
    end
    string match -qr '^(\d+(\.\d+){0,2})?$' -- "$prefix" || return 1

    set -l installed_dirs $versions_dir/v*
    set -q installed_dirs[1] || return 1
    set -l matches (path basename $installed_dirs | string replace -r '^v' '')
    if test -n "$prefix"
        set matches (string match -r -- '^'(string escape --style=regex -- $prefix)'(?:\.\d+)*$' $matches)
    end
    set -q matches[1] || return 1

    set -l node_dir $versions_dir/v(printf '%s\n' $matches | sort -t. -k1,1n -k2,2n -k3,3n | tail -n 1)
    test -x $node_dir/bin/node || return 1

    # Drop node versions inherited from a parent shell before adding the new one
    set -l other_paths
    for entry in $PATH
        string match -q -- "$versions_dir/*" $entry || set -a other_paths $entry
    end
    set -gx PATH $node_dir/bin $other_paths
    set -gx NVM_BIN $node_dir/bin
    set -gx NVM_INC $node_dir/include/node
    # `set` keeps the status of the loop above, so report success explicitly
    return 0
end

# Put node on PATH for every shell, so scripts, ssh commands and git hooks get it too.
# Only uses installed versions here; installing is left to interactive shells below.
# Priority: .nvmrc > default
set -l nvmrc_version
test -f .nvmrc && set nvmrc_version (string trim <.nvmrc)[1]
__nvm_activate_installed $nvmrc_version || __nvm_activate_installed default
set -l node_activated $status

# pnpm setup
set -l pnpm_home ~/.local/share/pnpm
if test "$os" = Darwin
    set pnpm_home ~/Library/pnpm
else if set -q XDG_DATA_HOME
    set pnpm_home $XDG_DATA_HOME/pnpm
end
if test -d $pnpm_home
    set -gx PNPM_HOME $pnpm_home
    fish_add_path --path $PNPM_HOME
end

# rbenv setup
if type -q rbenv
    rbenv init - fish | source
end

# budimanjojo/tmux.fish configuration
set -g fish_tmux_autostart false
set -g fish_tmux_config "$XDG_CONFIG_HOME/tmux/tmux.conf"
set -g fish_tmux_default_session_name "asl"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
test -f ~/.orbstack/shell/init2.fish && source ~/.orbstack/shell/init2.fish

# --- Interactive Shell Setup ---
# Everything below is only useful at a prompt; scripts and `fish -c` skip it.
status is-interactive || return 0

# Fish shell specific settings
set -g fish_greeting # No greeting
set -g fish_key_bindings fish_vi_key_bindings

# Auto-switch node version on directory change based on .nvmrc
function __nvm_auto_use --on-variable PWD --description "Auto-switch node version based on .nvmrc"
    test -f .nvmrc || return 0
    set -l node_ver (string trim <.nvmrc)[1]
    __nvm_activate_installed $node_ver && return 0
    if not nvm use $node_ver --silent 2>/dev/null
        echo "Installing node $node_ver from .nvmrc..."
        nvm install $node_ver
    end
end

# Fall back to nvm itself where the fast path above could not provide node
# Priority: .nvmrc (installing it if missing) > default > lts
if test -f .nvmrc
    __nvm_auto_use
else if test $node_activated -ne 0
    nvm use default --silent 2>/dev/null
    or nvm use --lts --silent 2>/dev/null
end

# fzf integration
if type -q fzf
    # `fzf --fish` needs fzf >= 0.48; older (e.g. Debian) builds ship a key-bindings file instead
    if fzf --fish >/dev/null 2>&1
        fzf --fish | source
    else if test -f /usr/share/doc/fzf/examples/key-bindings.fish
        source /usr/share/doc/fzf/examples/key-bindings.fish
        fzf_key_bindings
    end
end

# --- Aliases (Abbreviations) ---

# General file system aliases
abbr l "ls"
abbr ll "ls -l"
abbr lal "ls -al"
abbr .. "cd .."
abbr ... "cd ../.."
abbr .... "cd ../../.."

# Tmux aliases
abbr tasl "tmux new -A -s asl"
abbr ta "tmux attach"

# Dotfiles configuration aliases
# The repository location differs per machine, so derive it from this file's symlink target
set -l dotfiles_dir (path dirname (path dirname (path resolve (status filename))))
abbr cfish "$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
abbr cnvim "$EDITOR $XDG_CONFIG_HOME/nvim/init.lua"
abbr cvim "$EDITOR $HOME/.vimrc"
abbr ctmux "$EDITOR $fish_tmux_config"
abbr csway "$EDITOR $XDG_CONFIG_HOME/sway/config"
abbr cdot "$EDITOR $dotfiles_dir/install.conf.yaml"
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
abbr gr "git restore"
abbr grs "git restore --staged"
abbr gf "git fetch"
abbr ga "git add"
abbr gs "git status"
abbr gwl "git worktree list"
abbr gwa "git worktree add"
abbr gwr "git worktree remove"

# System aliases
if command -q systemctl
    abbr susp "systemctl suspend"
else if test "$os" = Darwin
    abbr susp "pmset sleepnow"
end

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

if type -q ocrmypdf
    abbr ocr "ocrmypdf -l ger --deskew --rotate-pages --clean"
end
