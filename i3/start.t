# This are all the commands, which execute every time time i3 starts.
# Utility for adjusting screen color according to the time of day and makes
# it easier for your eyes to function
exec --no-startup-id redshift -l 48:17 -t 3900:3900
# network manager applet for simple network management from i3-bar
exec --no-startup-id nm-applet
# Set the X background to solid gruvbox background color. Gruvbox rocks!
exec --no-startup-id xsetroot -solid '#282828'
# Always startup Discord :-).
exec --no-startup-id discord
# Create a keyboard map for switching keyboard layouts.
exec --no-startup-id setxkbmap -layout us,sk -variant ,qwerty -option 'grp:lalt_lshift_toggle'
# Start a notification daemon.
exec --no-startup-id dunst
# Start flameshot, a screen shotting utility.
exec flameshot


@@ legionnaire
# Ensure monitors are set up the way I want them to be.
exec --no-startup-id xrandr --output eDP-1 --off && xrandr --output HDMI-1 --primary  && xrandr --output DP-1 --right-of HDMI-1 move $ws1 to output HDMI-1 move $ws2 to output DP-1
exec --no-startup-id xrandr --output eDP-1-1 --off && xrandr --output HDMI-1-1 --primary  && xrandr --output DP-1-1 --right-of HDMI-1-1 move $ws1 to output HDMI-1-1 move $ws2 to output DP-1
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

# window color settings
# class                  border  backgr. text indicator child_border
client.focused		 $purple $purple $bg $purple $purple 
client.focused_inactive  $bg $bg $cyan $bg $bg
client.unfocused	 $bg $bg $cyan $bg $bg
client.urgent            $bg $bg $cyan $bg $bg
client.placeholder       $bg $bg $cyan $bg $bg
client.background        $bg

# Monitor and workspace setup.
workspace $ws1 output primary
workspace $ws2 output DP1
