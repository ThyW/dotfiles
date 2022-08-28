# Colors for the gruvbox theme: https://github.com/morhetz/gruvbox
set $bg #282828
set $bg0_h #1d2021
set $bg0_s #32302f
set $bg1 #3c3836
set $bg2 #504945
set $bg3 #665c54
set $bg4 #7c6f64

set $fg #ebdbb2
set $fg0 #fbf1c7
set $fg2 #d5c4a1
set $fg3 #bdae93
set $gg4 #a89984

set $gray #928374
set $lightgray #a89984

set $red #cc241d
set $lightred #fb4934

set $green #98971a
set $lightgreen #b8bb26

set $yellow #d79921
set $lightyellow #fabd2f

set $blue #458588
set $lightblue #83a598

set $purple #b16286
set $lightpurple #d3869b

set $aqua #689d68
set $lightaqua #8ec07c

set $orange #d65d0e
set $lightorange #fe8019

# Default modifier: Windows key
set $mod Mod4

# Second modifier: ALT key
set $mod2 Mod1

# Pixel width of window borders.
set $border 4

# Terminal emulator
set $term kitty

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
