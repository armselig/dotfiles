# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/bashrc.pre.bash"
# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
# eval "$(fig init bash pre)"

#export PATH="$HOME/homebrew/bin:$PATH"

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#source "$HOME/.cargo/env"

# Fig post block. Keep at the bottom of this file.
#

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/bashrc.post.bash"
. "$HOME/.cargo/env"
