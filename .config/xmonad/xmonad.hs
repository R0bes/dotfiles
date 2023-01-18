import XMonad
import XMonad.Util.NamedActions
import XMonad.Actions.SpawnOn (manageSpawn)
import Data.Monoid


import My.Config
import My.Keys
import My.Mouse
import My.Layouts
import My.Theme
import My.Startup
import My.Workspaces



--myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
--myManageHook = composeAll [
--  className =? "firefox"   --> W.shift $ myWorkspaces !! 3
--  ]


main = xmonad $ addDescrKeys' ((myModMask, xK_F1), showKeybindings) myKeys $  def { 
    terminal              = myTerminal,
    modMask               = myModMask,
    borderWidth           = myBorderWidth,
    normalBorderColor     = myNormalColor,
    focusedBorderColor    = myFocusColor,
    layoutHook            = myLayoutHook,
    --mouseBindings         = myMouseBindings,
    workspaces            = myWorkspaces,
    startupHook           = myStartupHook,
    manageHook            = manageSpawn <+> manageHook def
    }
