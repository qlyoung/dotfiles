set fish_greeting ""
set EDITOR "vim"
set TERM xterm-256color
set color_cwd
set HOMEBREW_NO_ANALYTICS 1
set -x fish_user_paths "/usr/local/bin" $fish_user_paths
set -x fish_user_paths "/usr/local/sbin" $fish_user_paths
set -x EDITOR nvim
set -x GPG_TTY (tty)
alias vim nvim
alias vimdiff 'nvim -d'
