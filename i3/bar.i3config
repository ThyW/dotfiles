# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
    font pango:Jet Brains Mono 9

    position top

    mode dock
    hidden_state hide

    status_command i3status-rs

    strip_workspace_numbers no

    i3bar_command i3bar -t

    height 18

@@ legionnaire
    tray_output HDMI-1
@!

    colors {
        separator   #666666
        background  $bg
        statusline  #dddddd
        focused_workspace   $bg	    $bg	    $yellow
        active_workspace    $bg	    $bg	    #888888
        inactive_workspace  $bg	    $bg	    #888888
        urgent_workspace    $red    #900000 #ffffff
    }
}
