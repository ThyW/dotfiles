set-option -g prefix C-a
unbind-key C-a
bind-key C-a send-prefix

bind -n M-h select-pane -L
bind -n M-j select-pane -D
bind -n M-k select-pane -U
bind -n M-l select-pane -R

bind -n M-n next-window
bind -n M-p previous-window

bind-key v splitw -v -c "#{pane_current_path}"
bind-key h splitw -h -c "#{pane_current_path}"
bind-key enter new-window
bind-key M-j resize-pane -D 5
bind-key M-h resize-pane -R 5
bind-key M-k resize-pane -U 5
bind-key M-l resize-pane -L 5

set-option -g default-shell /bin/bash 
set -g default-terminal "xterm-256color"
set -g status-style fg=colour8,bold,bg=0
set -g status-left " "
set -g status-right "%R"
set -g window-status-format "[#W]" 
set -g window-status-separator " "
set -g window-status-current-format "#[fg=colour5,bold][#W]"

bind-key r source-file ~/.tmux.conf\; display-message "reloaded tmux config"
set-option -g focus-events on
set-option -sg escape-time 10
