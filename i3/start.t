# This are all the commands, which execute every time time i3 starts.
# Utility for adjusting screen color according to the time of day and makes
# it easier for your eyes to function
exec --no-startup-id redshift -l 48:17 -t 3900:3900

# network manager applet for simple network management from i3-bar
exec --no-startup-id nm-applet

# Set the X background to solid gruvbox background color. Gruvbox rocks!
exec --no-startup-id xsetroot -solid '$bg'

# Always startup Discord :-).
exec --no-startup-id discord

# Create a keyboard map for switching keyboard layouts.
exec --no-startup-id \
setxkbmap -layout us,sk -variant ,qwerty -option 'grp:lalt_lshift_toggle'

# Start a notification daemon.
exec --no-startup-id dunst

# Start flameshot, a screen shotting utility.
exec flameshot


@@ legionnaire
# Ensure monitors are set up the way I want them to be.
exec --no-startup-id xrandr --output eDP-1 --off \
&& xrandr --output HDMI-1 --primary \
&& xrandr --output DP-1 --right-of HDMI-1 \
move $ws1 to output HDMI-1 move $ws2 to output DP-1
exec --no-startup-id xrandr --output eDP-1-1 --off \
&& xrandr --output HDMI-1-1 --primary \
&& xrandr --output DP-1-1 --right-of HDMI-1-1 \
move $ws1 to output HDMI-1-1 move $ws2 to output DP-1
@!

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# Set the font.
font pango:Iosevka 9

# Set tabbed layout by default.
workspace_layout default

# window border styles 
default_border pixel $border
default_floating_border pixel $border
title_align left

# No automatic back and forth between workspaces.
workspace_auto_back_and_forth no

# Colors for different parts of windows.
# class			     border		backgr.		text		indicator	child_border
client.focused		     $purple		$purple		$bg1		$purple		$purple
client.focused_inactive	     $bg		$bg		$fg3		$bg		$bg
client.unfocused	     $bg		$bg		$fg3		$bg		$bg
client.urgent		     $bg		$bg		$fg3		$bg		$bg
client.placeholder	     $bg		$bg		$fg3		$bg		$bg
client.background	     $bg

@@ legionnaire
# Monitor and workspace setup.
workspace $ws1 output HDMI-1
workspace $ws2 output DP-1
@!

# Assign windows to specific workspaces.
assign [class="^Discord$"] number 2

# When a windows is activated, it request focus. We should comply with the
# windows focus.
focus_on_window_activation focus

# Change the title format for all windows.
for_window [class=".*"] \
title_format "%title [class=%class] [instance=%instance]"

# Show window icons for all windows.
for_window [all] title_window_icon off

# If the window title is set to floating, toggle float to for that window.
for_window [title="floating"] floating toggle
