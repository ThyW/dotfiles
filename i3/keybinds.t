# Keybindings:
# They are not too different from the defaults, only some minor tweaks and
# additions.

# Launch a terminal.
bindsym $mod+Return exec $term
bindsym $mod2+Return exec $term -t "floating"

@@ legionnaire
# Execute Firefox-Nightly.
bindsym $mod+i exec firefox-nightly
@!

@@ terminator
# Execute Firefox.
bindsym $mod+i exec firefox
@!

# Kill the currently focused window.
bindsym $mod+Shift+q kill

# Start dmenu (a program launcher).
bindsym $mod+d exec --no-startup-id dmenu_run -fn 'Iosevka:8'

# flameshot screenshotting utility
bindsym Print exec --no-startup-id flameshot gui

# Change focus.
bindsym $mod+h	   focus left
bindsym $mod+j	   focus down
bindsym $mod+k	   focus up
bindsym $mod+l	   focus right
bindsym $mod+Left  focus left
bindsym $mod+Down  focus down
bindsym $mod+Up	   focus up
bindsym $mod+Right focus right

# Move a focused window.
bindsym $mod+Shift+h	 move left
bindsym $mod+Shift+j	 move down
bindsym $mod+Shift+k	 move up
bindsym $mod+Shift+l	 move right
bindsym $mod+Shift+Left  move left
bindsym $mod+Shift+Down  move down
bindsym $mod+Shift+Up	 move up
bindsym $mod+Shift+Right move right

# Make currently focused container fullscreen.
bindsym $mod+f fullscreen toggle

# When a window is floating, make it sticky, so that it follows you, when you
# switch workspace.
bindsym $mod+e sticky toggle

# Show or hide window border.
bindsym $mod+Shift+b border pixel 0
bindsym $mod+b border pixel $border

# Change container layout (stacked, tabbed, toggle split).
bindsym $mod+s layout toggle

# Toggle tiling / floating mode for focused container.
bindsym $mod+space floating toggle 

# Focus the parent container.
bindsym $mod+a focus parent

# Focus the child container.
bindsym $mod+c focus child

# Switch to a given workspace.
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

@@ legionnaire
# Move workspace to monitor one and two.
bindsym $mod+Ctrl+1 move workspace to output HDMI-1
bindsym $mod+Ctrl+2 move workspace to output DP-1
@!

# Move focused container to a given workspace.
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

# Reload the configuration file.
bindsym $mod+Shift+c reload
# Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# Exit i3 (logs you out of your X session).
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"
