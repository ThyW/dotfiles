#    __               __       ______            _____          #
#   / /_  ____ ______/ /_     / ____/___  ____  / __(_)___ _    #
#  / __ \/ __ `/ ___/ __ \   / /   / __ \/ __ \/ /_/ / __ `/    #
# / /_/ / /_/ (__  ) / / /  / /___/ /_/ / / / / __/ / /_/ /     #
#/_.___/\__,_/____/_/ /_/   \____/\____/_/ /_/_/ /_/\__, /      #
#                                                  /____/       #
#################################################################

# Welcome message
# cal -m
# date +"%Y %X"
# HOST=$(hostnamectl | awk 'NR==1{print $3}')
# echo -e "Welcome, \e[1;32m$USER\e[0m, to \e[1;33m$HOST\e[0m"

PREVIOUS=""
export HOSTNAME

# alias ls='ls --color=auto'
alias vykaz='python3 ~/.mail.py'
alias suspend='sudo systemctl start suspend.target && i3lock -c 111111'
alias wgstart='sudo systemctl start wg-quick@wg0'
alias use-nvidia='optimus-manager --switch nvidia'
alias use-intel='optimus-manager --switch intel'
alias use-hybrid='optimus-manager --switch hybrid'
alias lanvidia='env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias technic='/mnt/data/graalvm-ce-19.2.0.1/bin/java -jar ~/Downloads/TechnicLauncher.jar'
alias spot='spotifyd && spt' 
alias autosort='~/.sorter/autosort' 
alias i3lock='i3lock -c 111111'
alias rs='cd ~/programming/rust/'
# alias vim='_run_vim() { sw neovide "$@"; }; _run_vim'
alias ls='exa'
alias vi='nvim'
alias fzf='sk'
alias bconf='vi ~/clones/dotfiles/bash/.bashrc.t && der -f ~/clones/dotfiles/derfile -a && clear && source ~/.bashrc'
alias vc=' vi ~/clones/dotfiles/nvim && der -f ~/clones/dotfiles/derfile -a'
alias i3c='vi ~/clones/dotfiles/i3/config.t && der -f ~/clones/dotfiles/derfile -a'
alias ac='vi ~/clones/dotfiles/alacritty/alacritty.yml.t && der -f ~/clones/dotfiles/derfile -a'
alias mute='pactl set-sink-volume 0 0%'
alias synccfg='~/sync-config.sh'
alias sc='cd ~/school/school20-21'
alias mutt='neomutt'
alias grep='rg'
alias cdf='cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"'
alias screencapture='ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 recording.mp4'
alias startx='startx'
alias mmc='lanvidia multimc 2>/dev/null'
alias xmc='nvim ~/.xmonad/xmonad.hs'
alias rend='echo "require(rmarkdown); render('$@')" | R --vanilla'
alias love='love-git'
alias cswp='rm /home/zir/.local/share/nvim/swap/* && rm ~/.cache/nvim/log'
@@ legionnaire
alias nv='neovide'
alias todo='vi ~/dashboard/index.norg'
@!

## Tmux aliases
alias splith='tmux splitw -h -p 50'
alias splitv='tmux splitw -v -p 50'

# Created by `userpath` on 2020-01-27 19:06:27
export TERM="xterm-256color"
export PATH="$PATH:~/.local/bin"
export PATH="${HOME}/.cargo/bin:${PATH}"
export PATH="$PATH:~/ds-viewer/"
export PATH="$PATH:~/appimages/"
export PATH="$PATH:/mnt/data/clion-2019.2.4/bin/"

alias Vi='sudoedit'

#export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library/"
# not used currently export PS1="\e[0;1;33m\]\u@\h:\e[2;32m\]\w\$\e[m\] "
export EDITOR="nvim"
export SSH_ASKPASS="/usr/lib/ssh/x11-ssh-askpass"
export READER='zathura'
export DISPLAY=:0.0;

set -o vi

# eval "$(register-python-argcomplete pipx)"
eval "$(starship init bash)"

bind '"jk":vi-movement-mode'

if [[ ! "$(tty)" = "/dev/tty1" ]]; then 
    if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
      exec tmux -u
    fi 
fi
