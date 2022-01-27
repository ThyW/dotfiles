#            _ _____    ______            _____              #
#           (_)__  /   / ____/___  ____  / __(_)___ _        #
#          / / /_ <   / /   / __ \/ __ \/ /_/ / __ `/        #
#         / /___/ /  / /___/ /_/ / / / / __/ / /_/ /         #   
#        /_//____/   \____/\____/_/ /_/_/ /_/\__, /          #
#                                          /____/            #
#                                                            #
##############################################################



# i3 config file (v4) 
# Please see https://i3wm.org/docs/userguide.html for a complete reference!  
# Fix monitors 
# Startup
exec --no-startup-id /usr/lib/geoclue-2.0/demos/agent
exec --no-startup-id redshift -l 48:17 -t 3900:3900
exec --no-startup-id nm-applet
exec --no-startup-id xsetroot -solid '#282828'
exec --no-startup-id discord
exec --no-startup-id volumeicon-alsa
exec --no-startup-id setxkbmap -layout us,sk -variant ,qwerty -option 'grp:lalt_lshift_toggle'
exec --no-startup-id dunst
exec flameshot

# setting up i3-gaps
gaps top 10
gaps bottom 10
gaps left 6
gaps right 6
gaps inner 6
gaps outer 6

bindsym $mod+g gaps top all set 0; gaps bottom all set 0; gaps left all set 0; gaps right all set 0; gaps inner all set 0;gaps outer all set 0;
bindsym $mod+Shift+g gaps top all set 10; gaps bottom all set 10; gaps left all set 6; gaps right all set 6; gaps inner all set 6; gaps outer all set 6;

set $mod Mod4
set $mod2 Mod1
set $border 4
# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:Iosevka 9

@@ legionnaire
exec --no-startup-id xrandr --output eDP-1 --off && xrandr --output HDMI-1 --primary  && xrandr --output DP-1 --right-of HDMI-1 move $ws1 to output HDMI-1 move $ws2 to output DP-1
exec --no-startup-id xrandr --output eDP-1-1 --off && xrandr --output HDMI-1-1 --primary  && xrandr --output DP-1-1 --right-of HDMI-1-1 move $ws1 to output HDMI-1-1 move $ws2 to output DP-1
@!

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod
for_window [ title="floating"] floating enable; mode "moveit"

# start a terminal and other app binds
bindsym $mod+Return exec alacritty
bindsym $mod2+Return exec alacritty -t "floating" 
@@ legionnaire
bindsym $mod+i exec firefox-nightly
@!
@@ terminator
bindsym $mod+i exec firefox
@!
bindsym $mod+Shift+d exec ~/Lightcord/Lightcord
bindsym $mod2+f exec alacritty -e vifm ~

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
#bindsym $mod+d exec rofi -show run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
bindsym $mod+d exec --no-startup-id dmenu_run -fn 'Iosevka:8'
bindsym $mod+c exec --no-startup-id dmconf

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# enable sticky windows
bindsym $mod+e sticky toggle

# show/hide window border
bindsym $mod+Shift+b border pixel 0
bindsym $mod+b border pixel $border

# set tabbed layout 
workspace_layout default

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout toggle

# toggle tiling / floating
bindsym $mod+space floating toggle 

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child 
# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

workspace 1 output primary
workspace 2 output DP1

# assigns
assign [class="Discord"] -> number 2

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# move workspace to monitor
bindsym $mod+Ctrl+1 move workspace to output HDMI-1

# move workspace to monitor
bindsym $mod+Ctrl+2 move workspace to output DP-1

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

set $bg #282828
set $red #cc241d
set $green #98971a
set $yellow #d79921
set $blue #458588
set $purple #b16286
set $aqua #689d68
set $gray #a89984
set $darkgray #1d2021

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

mode "moveit" {
    bindsym k move up 20px
    bindsym h move left 20px
    bindsym j  move down 20px
    bindsym l move right 20px
    bindsym Mod4+m mode "default"

    # move by a larger margin
    bindsym Shift+k move up 100px
    bindsym Shift+h move left 100px
    bindsym Shift+j  move down 100px
    bindsym Shift+l move right 100px

    # back to normal: Enter or Escape or $mod+r
    bindsym Return mode "default"
    bindsym Escape mode "default"
    bindsym $mod+r mode "default"
}

bindsym Mod4+m focus floating; mode "moveit"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
    font pango:Iosevka Term 9
    position top
    mode dock
    status_command i3status-rs
    strip_workspace_numbers yes
    i3bar_command i3bar -t 
    height 19
    colors {
        separator #666666
        background $bg
        statusline #dddddd
        focused_workspace $bg $bg $yellow
        active_workspace $bg $bg #888888
        inactive_workspace $bg $bg #888888
        urgent_workspace $red #900000 #ffffff
    }
}

# window color settings
# class                  border  backgr. text indicator child_border
client.focused		 $purple $purple $bg $purple $purple 
client.focused_inactive  $bg $bg $cyan $bg $bg
client.unfocused	 $bg $bg $cyan $bg $bg
client.urgent            $bg $bg $cyan $bg $bg
client.placeholder       $bg $bg $cyan $bg $bg
client.background        $bg

# window border styles 
default_border pixel $border
default_floating_border pixel $border
title_align left

# screenshots

bindsym $mod+p mode "screenshot"
mode "screenshot" {
    bindsym --release a exec "screenshot screen"
    bindsym --release s exec "screenshot focused"
    bindsym --release f exec "screenshot select"

    bindsym Escape mode "default"
    bindsym Return mode "default"
}

mode "settings" {
    bindsym a exec pavucontrol
    bindsym i exec "alacritty -e nvim ~/.config/i3/config"
    bindsym v exec "alacritty -e nvim ~/.config/nvim/init.vim"
    bindsym b exec "alacritty -e nvim ~/.bashrc && source"

    bindsym Escape mode "default"
    bindsym Return mode "default"
}
bindsym $mod+$mod2+s mode "settings"

# toggle compositor
bindsym $mod+n exec picom --config ~/.config/picom/picom.conf
bindsym $mod+Shift+n exec killall picom

# back and forth
workspace_auto_back_and_forth no