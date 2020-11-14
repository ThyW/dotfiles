#    __               __       ______            _____          #
#   / /_  ____ ______/ /_     / ____/___  ____  / __(_)___ _    #
#  / __ \/ __ `/ ___/ __ \   / /   / __ \/ __ \/ /_/ / __ `/    #
# / /_/ / /_/ (__  ) / / /  / /___/ /_/ / / / / __/ / /_/ /     #
#/_.___/\__,_/____/_/ /_/   \____/\____/_/ /_/_/ /_/\__, /      #
#                                                  /____/       #
#################################################################

# Welcome message
cal -m
date +"%Y %X"
HOST=$(hostnamectl | awk 'NR==1{print $3}')
echo -e "Welcome, \e[1;32m$USER\e[0m, to \e[1;33m$HOST\e[0m"

alias ls='ls --color=auto'
alias vykaz='python3 ~/.mail.py'
alias suspend='sudo systemctl start suspend.target && i3lock -c 111111'
alias wgstart='sudo systemctl start wg-quick@wg0'
alias use-nvidia='optimus-manager --switch nvidia'
alias use-intel='optimus-manager --switch intel'
alias use-hybrid='optimus-manager --switch hybrid'
alias lanvidia='env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia gamemoderun'
alias technic='/mnt/data/graalvm-ce-19.2.0.1/bin/java -jar ~/Downloads/TechnicLauncher.jar'
alias spot='spotifyd && spt' 
alias autosort='~/.sorter/autosort' 
alias i3lock='i3lock -c 111111'
alias rs='cd ~/programming/rust/'
alias vim='_run_vim() { sw neovide "$@"; }; _run_vim'
alias bconf='vim ~/.bashrc && ~/sync-config.sh && clear && source ~/.bashrc'
alias vc='vim ~/.config/nvim/init.vim && ~/sync-config.sh'
alias i3c='vim ~/.config/i3/config && ~/sync-config.sh'
alias sb='source ~/.bashrc'
alias ac='vim ~/.config/alacritty/alacritty.yml && ~/sync-config.sh'
alias mute='pactl set-sink-volume 0 0%'
alias synccfg='~/sync-config.sh'
alias sc='cd ~/school/school20-21'
alias mutt='neomutt'
alias fzf='sk'


# Created by `userpath` on 2020-01-27 19:06:27
export TERM="xterm-256color"
export PATH="$PATH:~/.local/bin"
export PATH="${HOME}/.cargo/bin:${PATH}"
export PATH="$PATH:~/ds-viewer/"
export PATH="$PATH:~/appimages/"
export PATH="$PATH:/mnt/data/clion-2019.2.4/bin/"
#export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library/"
# not used currently export PS1="\e[0;1;33m\]\u@\h:\e[2;32m\]\w\$\e[m\] "
export DISCORD_TOKEN="NjgyMTc5MTIzOTI5NDE1Njg1.XlZPKA.dYRhi3PeL268BZNmaE0AD7fb8fQ"
export EDITOR="/usr/bin/nvim"
export SSH_ASKPASS="/usr/lib/ssh/x11-ssh-askpass"
export READER='zathura'

set -o vi

# eval "$(register-python-argcomplete pipx)"
eval "$(starship init bash)"

bind '"jk":vi-movement-mode'
