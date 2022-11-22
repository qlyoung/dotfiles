# no greeting
set fish_greeting ""
# set TERM xterm-256color
# set color_cwd
set -x fish_user_paths "/usr/local/bin" $fish_user_paths
set -x fish_user_paths "/usr/local/sbin" $fish_user_paths
set -x fish_user_paths "/usr/local/go/bin" $fish_user_paths
set -x GOPATH /home/qlyoung/go
set -x fish_user_paths "$GOPATH/bin" $fish_user_paths
set -x fish_user_paths "/home/qlyoung/.cargo/bin" $fish_user_paths
set -x fish_user_paths "$HOME/.poetry/bin" $fish_user_paths
set -x fish_user_paths "$HOME/scripts/nvidia" $fish_user_paths
set -x fish_user_paths "$HOME/scripts/nvidia/ngc" $fish_user_paths
set -x fish_user_paths "$HOME/scripts/misc" $fish_user_paths
set -x NDAS_PDS /home/qlyoung/projects/ndas/private/doc/playbooks/service/
set -x NDAS_SMITH /home/qlyoung/projects/ndas/tools/smith/

set -x SSH_AUTH_SOCK /run/user/1000/ssh-agent.socket

# set -x fish_user_paths (dirname (go list -f '{{.Target}}' .)) $fish_user_paths

# alias clear "math (random) \% 10 == 0; and timeout 2 cbeams -o; clear; or clear"

# Poetry
export PATH="/home/qlyoung/.local/bin:$PATH"

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

# Shell prompt
set fish_git_dirty_color red
set fish_git_not_dirty_color green
set fish_color_user blue
set fish_color_cwd ff781f

function print_fish_colors --description 'Shows the various fish colors being used'
    set -l clr_list (set -n | grep fish | grep color | grep -v __)
    if test -n "$clr_list"
        set -l bclr (set_color normal)
        set -l bold (set_color --bold)
        printf "\n| %-38s | %-38s |\n" Variable Definition
        echo '|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|'
        for var in $clr_list
            set -l def $$var
            set -l clr (set_color $def)
            or begin
                printf "| %-38s | %s%-38s$bclr |\n" "$var" (set_color --bold white --background=red) "$def"
                continue
            end
            printf "| $clr%-38s$bclr | $bold%-38s$bclr |\n" "$var" "$def"
        end
        echo '|________________________________________|________________________________________|'\n
    end
end


function cb
  echo (git status -sb | head -n 1 | cut -d' ' -f2)
end

function tere
    set --local result (/usr/bin/tere $argv)
    [ -n "$result" ] && cd -- "$result"
end
