import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W
import Control.Monad(liftM2)
import Data.List(isInfixOf)
import qualified Data.Map as M
import System.IO(hPutStrLn)

-- Default terminal
-- myTerminal = "xterm"
myTerminal = "urxvt"

-- Border width in pixels
myBorderWidth = 1

myModMask = mod4Mask -- Rebind Mod to the Windows key

-- Whether focus follows the mouse pointer.  myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = True

-- Virtual screens
myWorkspaces = ["1:sh", "2:dev", "3:web", "4:torrent"] ++ map show [5..7] ++ ["8:video", "9:tmp"]

-- Border colors
myNormalBorderColor  = "#cccccc"
myFocusedBorderColor = "#cd8b00"

-- Layouts
myLayout =
    avoidStruts $
    tiled ||| Mirror tiled ||| Full
        where
            -- default tiling algorithm partitions the screen into two panes
            tiled   = Tall nmaster delta ratio
            -- The default number of windows in the master pane
            nmaster = 1
            -- Default proportion of screen occupied by master pane
            ratio   = 1/3
            -- Percent of screen to increment by when resizing panes
            delta   = 3/100

-- Manage hook
myManageHook = composeAll . concat $ [
    -- shifts
    [className =? "Gvim"         --> viewShift "2:dev"],
    [className =? "Chromium"     --> viewShift "3:web"],
    [className =? "Transmission" --> viewShift "4:torrent"],
    [className =? "Vlc"          --> viewShift "8:video"],

    -- custom floats
    [(className =? "Firefox" <&&> resource =? "Dialog") --> doFloat],

    -- borrowed from http://www.haskell.org/haskellwiki/Xmonad/General_xmonad.hs_config_tips
    [className =? c --> doFloat | c <- myFloatsC],
    [fmap (c `isInfixOf`) className --> doFloat | c <- myMatchAnywhereFloatsC]
    ]
    where
        myFloatsC = ["Xmessage", "Gimp"]
        myMatchAnywhereFloatsC = ["Pidgin", "Skype"]
        viewShift = doF . liftM2 (.) W.greedyView W.shift


-- Run XMonad with XMobar
main = do
    xmproc <- spawnPipe "/usr/bin/xmobar"
    xmonad defaultConfig {
        -- Generic
        terminal           = myTerminal,
        modMask            = myModMask,
        borderWidth        = myBorderWidth,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

        -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook <+> manageDocks <+> manageHook defaultConfig,
        logHook = dynamicLogWithPP xmobarPP {
            ppOutput = hPutStrLn xmproc,
            ppTitle = xmobarColor "brown" "" . shorten 50
            }
        }

