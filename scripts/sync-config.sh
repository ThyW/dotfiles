#!/usr/bin/bash 

cp -r ~/.config/alacritty/alacritty.yml ~/programming/dotfiles/alacritty/
cp -r ~/.config/i3/config ~/programming/dotfiles/i3/
cp -r ~/.config/i3/status.toml ~/programming/dotfiles/i3/
cp -r ~/.config/nvim/init.vim ~/programming/dotfiles/nvim/
cp -r ~/sync-config.sh ~/programming/dotfiles/scripts
cp -r ~/.bashrc ~/programming/dotfiles/scripts/
cp -r ~/sync-config.sh ~/programming/dotfiles/scripts/

temp="$PWD"

cd ~/programming/dotfiles/
git add .
git commit -m "Changes"
git push

cd $temp
