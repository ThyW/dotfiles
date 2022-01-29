# Colors for the gruvbox theme: https://github.com/morhetz/gruvbox
set $bg #282828
set $red #cc241d
set $green #98971a
set $yellow #d79921
set $blue #458588
set $purple #b16286
set $aqua #689d68
set $gray #a89984
set $darkgray #1d2021

# Default modifier: Windows key
set $mod Mod4

# Second modifier: ALT key
set $mod2 Mod1

# Pixel width of window borders.
set $border 4

# Terminal emulator
set $term alacritty

# Define names for default workspaces for which we configure key bindings later
# on. We use variables to avoid repeating the names in multiple places.
set $ws1 "1:1"
set $ws2 "2:2"
set $ws3 "3:3"
set $ws4 "4:4"
set $ws5 "5:5"
set $ws6 "6:6"
set $ws7 "7:7"
set $ws8 "8:8"
set $ws9 "9:9"
set $ws10 "10:10"

# Load all the other configuration files, these are loaded from here, since we
# want to use the variables set in this file, in the included files. 
include ~/.config/i3/start
include ~/.config/i3/bar
include ~/.config/i3/keybinds
include ~/.config/i3/gaps
