module My.Keys where


import My.Config
import My.Bars
import My.Workspaces


import XMonad

import XMonad.Core

import XMonad.Operations

import XMonad.Util.EZConfig (mkNamedKeymap)
import XMonad.Util.NamedActions
import XMonad.Util.Run (spawnPipe)

import XMonad.Layout.ResizableTile

import System.IO (hClose, hPutStr)

import Data.Char (toUpper)

import Graphics.X11.Types

import XMonad.Doc.Extending

import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS (Direction1D(..), moveTo, shiftTo, WSType(..), nextScreen, prevScreen)

-- Super Key
myModMask = mod4Mask


myKeys :: XConfig l0 -> [((KeyMask, KeySym), NamedAction)]
myKeys c = 
    let subKeys str ks = subtitle' str : mkNamedKeymap c ks in

    -- XMonard controls
    subKeys "XMonad Essentials" [
    ("M-C-r", addName "Recompile XMonad"                    $ spawn "xmonad --recompile; xmonad --restart")
    ]


    -- Workspaces
    ^++^ subKeys "Switch Workspace" [
    ("M-1", addName "Switch to workspace 1"    $ (windows $ W.greedyView $ myWorkspaces !! 0)),
    ("M-2", addName "Switch to workspace 2"    $ (windows $ W.greedyView $ myWorkspaces !! 1)),
    ("M-3", addName "Switch to workspace 3"    $ (windows $ W.greedyView $ myWorkspaces !! 2)),
    ("M-4", addName "Switch to workspace 4"    $ (windows $ W.greedyView $ myWorkspaces !! 3)),
    ("M-5", addName "Switch to workspace 5"    $ (windows $ W.greedyView $ myWorkspaces !! 4)),
    ("M-6", addName "Switch to workspace 6"    $ (windows $ W.greedyView $ myWorkspaces !! 5)),
    ("M-7", addName "Switch to workspace 7"    $ (windows $ W.greedyView $ myWorkspaces !! 6)),
    ("M-8", addName "Switch to workspace 8"    $ (windows $ W.greedyView $ myWorkspaces !! 7)),
    ("M-9", addName "Switch to workspace 9"    $ (windows $ W.greedyView $ myWorkspaces !! 8))
    ]
    ^++^ subKeys "Send window to workspace" [
    ("M-S-1", addName "Send to workspace 1"    $ (windows $ W.shift $ myWorkspaces !! 0)),
    ("M-S-2", addName "Send to workspace 2"    $ (windows $ W.shift $ myWorkspaces !! 1)),
    ("M-S-3", addName "Send to workspace 3"    $ (windows $ W.shift $ myWorkspaces !! 2)),
    ("M-S-4", addName "Send to workspace 4"    $ (windows $ W.shift $ myWorkspaces !! 3)),
    ("M-S-5", addName "Send to workspace 5"    $ (windows $ W.shift $ myWorkspaces !! 4)),
    ("M-S-6", addName "Send to workspace 6"    $ (windows $ W.shift $ myWorkspaces !! 5)),
    ("M-S-7", addName "Send to workspace 7"    $ (windows $ W.shift $ myWorkspaces !! 6)),
    ("M-S-8", addName "Send to workspace 8"    $ (windows $ W.shift $ myWorkspaces !! 7)),
    ("M-S-9", addName "Send to workspace 9"    $ (windows $ W.shift $ myWorkspaces !! 8))
    ]


    -- Monitors
    ^++^ subKeys "Monitors" [
    ("M-S-<Right>", addName "Switch focus to next monitor"  $ nextScreen),
    ("M-S-<Left>", addName "Switch focus to prev monitor"   $ prevScreen)
    ]

    -- Windows
    ^++^ subKeys "Windows s" [ 
    ("M-<Right>", addName "Switch focus to next Window"     $ windows W.focusDown),
    ("M-<Left>", addName "Switch focus to prev Window"      $ windows W.focusUp),
    ("M-c", addName "Kill focused window"                   $ kill),
    ("M-h", addName "Shrink Window"                         $ sendMessage Shrink),
    ("M-l", addName "Expand Window"                         $ sendMessage Expand),
    ("M-a", addName "Shrink window vertically"              $ sendMessage MirrorShrink),
    ("M-y", addName "Expand window vertically"              $ sendMessage MirrorExpand)
    ]

    -- Layouts
    ^++^ subKeys "Layouts" [
    ("M-<Space>", addName "Next Layout"                     $ sendMessage NextLayout)
    ]
      
    -- Programs
    ^++^ subKeys "Favourites" [
    ("M-<Return>", addName "Launch Terminal"                $ spawn (myTerminal)),
    ("M-b", addName "Launch web browser"                    $ spawn (myBrowser)),
    ("M-i", addName "Launch vs code"                        $ spawn (myIDE))
    ]

      
    -- EWW
    ^++^ subKeys "EWW`s" [
    ("M-s", addName "Toggle Sidebar"                           $ toggleSidebar),
    ("M-d", addName "Toggle Dashboard"                         $ toggleDashboard)
    ]



subtitle' :: String -> ((KeyMask, KeySym), NamedAction)
subtitle' x = ((0,0), NamedAction $ map toUpper $ sep ++ "\n-- " ++ x ++ " --\n" ++ sep)
    where
        sep = replicate (6 + length x) '-'

showKeybindings :: [((KeyMask, KeySym), NamedAction)] -> NamedAction
showKeybindings x = addName "Show Keybindings" $ io $ do
    h <- spawnPipe $ "yad --text-info -title"
    hPutStr h (unlines $ showKmSimple x)
    hClose h
    return()
