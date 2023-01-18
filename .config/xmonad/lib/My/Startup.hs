module My.Startup where

import XMonad
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Actions.SpawnOn (spawnOn)

myStartupHook :: X() 
myStartupHook = do
    spawnOnce "picom"
    spawnOnce "nitrogen --restore"
    spawn "$HOME/.config/polybar/launch.sh"
    spawnOn "3:audio" "vis"
    spawnOn "3:audio" "ncspot"
