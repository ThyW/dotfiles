# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.


# start a terminal and other app binds
bindsym $mod+Return exec alacritty
bindsym $mod2+Return exec alacritty -t "floating" 
@@ legionnaire
bindsym $mod+i exec firefox-nightly
@!
@@ terminator
bindsym $mod+i exec firefox
@!

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
#bindsym $mod+d exec rofi -show run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
bindsym $mod+d exec --no-startup-id dmenu_run -fn 'Iosevka:8'

# flameshot screenshotting utility
bindsym Print exec --no-startup-id flameshot gui

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

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout toggle

# toggle tiling / floating
bindsym $mod+space floating toggle 

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child 

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
