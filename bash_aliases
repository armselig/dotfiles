# tmux
alias tasl='tmux new -As asl'

# git
alias gpl='git pull'
alias gps='git push'
alias gco='git checkout '
alias gcm='git commit -m'
alias gs='git status'
alias ga='git add '

# ls
if [ -x "$(command -v lsd)" ]; then
    alias l='lsd -l'
    alias ll='lsd -al'
fi

# config
alias cbash='$EDITOR $HOME/.bashrc'
alias sbash='source $HOME/.bashrc'
alias cvim='$EDITOR $HOME/.vimrc'
alias cnvim='$EDITOR $XDG_CONFIG_HOME/nvim/init.lua'
alias ctmux='$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf'
alias csway='$EDITOR $XDG_CONFIG_HOME/sway/config'
alias cala='$EDITOR $XDG_CONFIG_HOME/alacritty/alacritty.toml'
alias cssh='$EDITOR $HOME/.ssh/config'

