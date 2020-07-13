#!/bin/bash
temp="$PWD"

current="$0"

cp current/../i3/config ~/.config/i3/
cp current/../i3/status.toml ~/.config/i3/
cp current/../nvim/init.vim ~/.config/nvim/
cp current/../alacritty/alacritty.yml ~/.config/alacritty
cp ./.bashrc ~/
