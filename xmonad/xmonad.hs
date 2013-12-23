import XMonad
import XMonad.Layout.SimpleFloat
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)


-- Terminal
myTerminal = "urxvt"

-- Workspaces
myWorkspaces = ["main", "web", "dev", "media"]

-- Layouts
defaultLayouts = tiled ||| Mirror tiled ||| simpleFloat ||| Full
    where
        -- default tiling algorithm partitions the screen into two panes
        tiled   = Tall nmaster delta ratio
        -- The default number of windows in the master pane
        nmaster = 1
        -- Default proportion of screen occupied by master pane
        ratio   = 2/3
        -- Percent of screen to increment by when resizing panes
        delta   = 3/100

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar"
    xmonad $ defaultConfig {
        terminal = myTerminal
      , workspaces = myWorkspaces
      , manageHook = manageDocks <+> manageHook defaultConfig
      , layoutHook = avoidStruts $ defaultLayouts
      , modMask = mod4Mask     -- Rebind Mod to the Windows key
    }

