import XMonad

import XMonad.Actions.CopyWindow (kill1)

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import XMonad.Layout.Accordion
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Circle
import XMonad.Layout.Cross
import XMonad.Layout.Dwindle
import XMonad.Layout.Gaps
import XMonad.Layout.MultiColumns
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed

import XMonad.StackSet as W

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.SpawnOnce

import System.IO

winKey :: KeyMask
winKey = mod4Mask

font :: String
font = "xft:monospace:regular:size=12:antialias=true:hinting=true"

myTerm :: String
myTerm = "alacritty"

browser :: String
browser = "firefox"

runner :: String
runner = "dmenu_run"

myBorderWidth :: Dimension
myBorderWidth = 5

normalBorColor :: String
normalBorColor = "#282828"

focusedBorColor :: String
focusedBorColor = "#d79921"

mLayout = tiled ||| simpleTabbed ||| emptyBSP ||| Full ||| Accordion ||| dwindle ||| spiral
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100
     -- mcol    = multiCol [0] 4 0.01 0.5
     dwindle = Dwindle R CW 1.5 1.1
     spiral  = Spiral R CW 1.5 1.1

startup :: X ()
startup = do 
    spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 --tint 0x282c34  --height 20 &"
    spawnOnce "redshift -l 48:17 -t 3900:3900 &"
    spawnOnce "nm-applet &"
    spawnOnce "feh --bg-scale ~/Pictures/wallpapers/wp-samurai.jpg &"
    spawnOnce "discord-canary &"
    spawnOnce "volumeicon-alsa &"
    spawnOnce "setxkbmap -layout us,sk -variant ,qwerty -option 'grp:lalt_lshift_toggle' &"
    spawnOnce "dunst &"
    spawnOnce "flameshot &"

binds c =
    [ ("M-S-o", spawn "xrandr --output eDP-1 --off && xrandr --output HDMI-1 --primary && xrandr --output DP-1 --right-of HDMI-1")
    , ("M-d", spawn "dmenu_run")
    , ("M-<Return>", spawn myTerm)
    , ("M-S-q", kill1)
    , ("M-S-r", restart "xmonad" True)
    , ("M-S-x", spawn "killall xmonad-x86_64-linux")
    , ("M-i", spawn browser)
    , ("M-g", sendMessage $ ToggleGaps)
    , ("M-S-s" spawn "pavucontrol")
    ]
    ++

    [("M-"++m++[k], windows $ f i)
        | (i, k) <- zip (XMonad.workspaces c) "1234567890"
        , (f, m) <- [(W.view, ""), (W.shift, "S-")]
    ]

mLogHook bar1 bar2 bar3 = dynamicLogWithPP xmobarPP
    { ppOutput  = \x -> hPutStrLn bar1 x >> hPutStrLn bar2 x >> hPutStrLn bar3 x
    , ppTitle   = xmobarColor "#b8bb26" "" . shorten 50
    , ppCurrent = xmobarColor "#d79921" "" . wrap "[" "]"
    , ppVisible = xmobarColor "#ebdbb2" ""
    , ppHidden  = xmobarColor "#434343" "" . wrap "*" ""
    }

main = do 
    b1 <- spawnPipe "xmobar -x 0 ~/.xmonad/xmobarrc1"
    b2 <- spawnPipe "xmobar -x 1 ~/.xmonad/xmobarrc1"
    b3 <- spawnPipe "xmobar -x 2 ~/.xmonad/xmobarrc2"
    xmonad $ docks (mconfig (mLogHook b1 b2 b3))

mconfig lHook = let c = def {
	 borderWidth = myBorderWidth
       , layoutHook = avoidStruts $ spacingRaw True (Border 0 3 3 3) True (Border 3 3 3 3) True $ mLayout
       , manageHook = manageHook defaultConfig
       , terminal = myTerm
       , normalBorderColor  = normalBorColor
       , focusedBorderColor = focusedBorColor 
       , modMask = winKey
       , logHook = lHook
       , startupHook = startup
	} in additionalKeysP c (binds c)
