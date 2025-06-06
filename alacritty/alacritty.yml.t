#     ___    __                _ __  __           ______            _____       #
#    /   |  / /___ ___________(_) /_/ /___  __   / ____/___  ____  / __(_)___ _ #
#   / /| | / / __ `/ ___/ ___/ / __/ __/ / / /  / /   / __ \/ __ \/ /_/ / __ `/ #
#  / ___ |/ / /_/ / /__/ /  / / /_/ /_/ /_/ /  / /___/ /_/ / / / / __/ / /_/ /  #
# /_/  |_/_/\__,_/\___/_/  /_/\__/\__/\__, /   \____/\____/_/ /_/_/ /_/\__, /   #
#                                   /____/                           /____/     #
#                                                                               #
#################################################################################
env:
  TERM: alacritty

# changing this so i know it changed
# and more stuff changed

@@ 'thief'
shell:
    program: wsl.exe ~ -d Ubuntu
@@

#window:
  #dimensions:
  #  columns: 0
  #  lines: 0

  #position:
  #  x: 0
  #  y: 0

  #padding:
  #  x: 0
  #  y: 0

  startup_mode: Windowed

  title: Alacritty

  #class:
    #instance: Alacritty
    #general: Alacritty

  #gtk_theme_variant: None

#scrolling:
  #history: 112.000

  #multiplier: 3

font:
  normal:
    # family: "SFMono Nerd Font Mono"
    # family: "Iosevka Term"
    family: "JetBrainsMono Nerd Font"


  style: Regular

  #bold:
    #family: monospace
    #style: Bold
  #italic:
    #family: monospace
    #style: Italic

  #bold_italic:
    #family: monospace
    #style: Bold Italic

@@ 'legionnaire'
  size: 12
@@
@@ 'terminator'
  size: 10.0
@@

  #offset:
  #  x: 0
  #  y: 0

  #glyph_offset:
  #  x: 0
  #  y: 0
  use_thin_strokes: true

#draw_bold_text_with_bright_colors: false
colors:
  # Default colors
  primary:
    # hard contrast: background = '#1d2021'
    background: '#282828'
    # soft contrast: background = '#32302f'
    foreground: '#ebdbb2'

  # Normal colors
  normal:
    black:   '#282828'
    red:     '#cc241d'
    green:   '#98971a'
    yellow:  '#d79921'
    blue:    '#458588'
    magenta: '#b16286'
    cyan:    '#689d6a'
    white:   '#a89984'

  # Bright colors
  bright:
      black:   '#928374'
      red:     '#fb4934'
      green:   '#b8bb26'
      yellow:  '#fabd2f'
      blue:    '#83a598'
      magenta: '#d3869b'
      cyan:    '#8ec07c'
      white:   '#ebdbb2' 
      

  indexed_colors:
    - { index: 16, color: '#fe8019' }
    - { index: 17, color: '#d65d0e' }
    - { index: 18, color: '#3c3836' }
    - { index: 19, color: '#504945' }
    - { index: 20, color: '#bdae93' }
    - { index: 21, color: '#ebdbb2' }
    - { index: 22, color: '#2e2e2e'}
    - { index: 235, color: '#282828'}


#visual_bell:
#  animation: EaseOutExpo
#  duration: 0
#  color: '#ffffff'

#background_opacity: 112.0

#selection:
  #semantic_escape_chars: ",│`|:\"' ()[]{}<>\t"
  #save_to_clipboard: false

#dynamic_title: true

cursor:
  #   - ▇ Block
  #   - _ Underline
  #   - | Beam
  style: Block

  #unfocused_hollow: true

live_config_reload: true

#shell:
#  program: /bin/bash
#  args:
#    - --login

#working_directory: None

#mouse:
  #double_click: { threshold: 300 }
  #triple_click: { threshold: 300 }

  #hide_when_typing: false

  #url:
    #launcher:
    #  program: xdg-open
    #  args: []

    #modifiers: None

#mouse_bindings:
#  - { mouse: Middle, action: PasteSelection }

# Key bindings
key_bindings:
  # (Windows, Linux, and BSD only)
  #- { key: V,        mods: Control|Shift, action: Paste            }
  #- { key: C,        mods: Control|Shift, action: Copy             }
  #- { key: Insert,   mods: Shift,         action: PasteSelection   }
  #- { key: Key0,     mods: Control,       action: ResetFontSize    }
  #- { key: Equals,   mods: Control,       action: IncreaseFontSize }
  #- { key: Add,      mods: Control,       action: IncreaseFontSize }
  #- { key: Subtract, mods: Control,       action: DecreaseFontSize }
  #- { key: Minus,    mods: Control,       action: DecreaseFontSize }

  # (Windows only)
  #- { key: Return,   mods: Alt,           action: ToggleFullscreen }

  # (macOS only)
  #- { key: Key0,   mods: Command,         action: ResetFontSize    }
  #- { key: Equals, mods: Command,         action: IncreaseFontSize }
  #- { key: Add,    mods: Command,         action: IncreaseFontSize }
  #- { key: Minus,  mods: Command,         action: DecreaseFontSize }
  #- { key: K,      mods: Command,         action: ClearHistory     }
  #- { key: K,      mods: Command,         chars: "\x0c"            }
  #- { key: V,      mods: Command,         action: Paste            }
  #- { key: C,      mods: Command,         action: Copy             }
  #- { key: H,      mods: Command,         action: Hide             }
  #- { key: M,      mods: Command,         action: Minimize         }
  #- { key: Q,      mods: Command,         action: Quit             }
  #- { key: W,      mods: Command,         action: Quit             }
  #- { key: F,      mods: Command|Control, action: ToggleFullscreen }

  #- { key: Paste,                    action: Paste                            }
  #- { key: Copy,                     action: Copy                             }
  #- { key: L,         mods: Control, action: ClearLogNotice                   }
  #- { key: L,         mods: Control, chars: "\x0c"                            }
  #- { key: PageUp,    mods: Shift,   action: ScrollPageUp,   mode: ~Alt       }
  #- { key: PageDown,  mods: Shift,   action: ScrollPageDown, mode: ~Alt       }
  #- { key: Home,      mods: Shift,   action: ScrollToTop,    mode: ~Alt       }
  #- { key: End,       mods: Shift,   action: ScrollToBottom, mode: ~Alt       }
        - { key: Space,  mods: Control, mode: Vi, action: ToggleViMode          }
        - { key: Space,  mods: Control, mode: Vi, action: ScrollToBottom          }

#debug:
  #render_timer: false

  #persistent_logging: false

  # Log level
  #
  # Values for `log_level`:
  #   - None
  #   - Error
  #   - Warn
  #   - Info
  #   - Debug
  #   - Trace
  #log_level: Warn

  # Print all received window events.
  #print_events: false
