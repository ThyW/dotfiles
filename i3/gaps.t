# Setting up i3-gaps
gaps top 10
gaps bottom 10
gaps left 6
gaps right 6
gaps inner 6
gaps outer 6

# Bindings for turning off gaps.
bindsym $mod+g gaps top all set 0; gaps bottom all set 0;\
gaps left all set 0; gaps right all set 0; gaps inner all set 0; \
gaps outer all set 0;

# Turn gaps back on.
bindsym $mod+Shift+g gaps top all set 10; gaps bottom all set 10;\
gaps left all set 6; gaps right all set 6; gaps inner all set 6;\
gaps outer all set 6;
