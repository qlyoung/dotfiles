# no greeting
set fish_greeting ""
set TERM xterm-256color
set color_cwd
set -x fish_user_paths "/usr/local/bin" $fish_user_paths
set -x fish_user_paths "/usr/local/sbin" $fish_user_paths

# required by gpg-agent
set -x GPG_TTY (tty)

# Homebrew
set HOMEBREW_NO_ANALYTICS 1

# vim
set -x EDITOR nvim
alias vim nvim
alias vimdiff 'nvim -d'
