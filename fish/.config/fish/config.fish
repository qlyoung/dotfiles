# no greeting
set fish_greeting ""
set TERM xterm-256color
set color_cwd
set -x fish_user_paths "/usr/local/bin" $fish_user_paths
set -x fish_user_paths "/usr/local/sbin" $fish_user_paths

# X dpi scaling
#set -g -x GDK_SCALE 2
#set -g -x GDK_DPI_SCALE 0.5
#set -g -x QT_AUTO_SCREEN_SCALE_FACTOR 1

# required by gpg-agent
set -x GPG_TTY (tty)

# Homebrew
set HOMEBREW_NO_ANALYTICS 1

# vim
set -x EDITOR nvim
alias vim nvim
alias vimdiff 'nvim -d'
alias rf 'sudo systemctl restart frr'

# Shell prompt
set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_status (git status -s)

  if test -n "$git_status"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  if test -n "$git_dir"
    printf '%s@%s [%s] %s%s%s> ' (whoami) (hostname|cut -d . -f 1) (parse_git_branch) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  else
    printf '%s@%s %s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end
end
