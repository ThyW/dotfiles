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
