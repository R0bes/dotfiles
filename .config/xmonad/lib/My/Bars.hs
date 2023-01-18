module My.Bars where

import XMonad
import XMonad.Core

toggleScript :: String
toggleScript = "$HOME/.config/eww/toggle_widgets.sh "


toggleSidebar :: X()
toggleSidebar = spawn (toggleScript ++ "date_side time_side weather_side sys_side")

toggleDashboard :: X()
toggleDashboard = spawn (toggleScript ++ "dash_logout dash_sleep dash_reboot dash_shutdown")


killAllBars :: X()
killAllBars = spawn "eww close-all"



-- weather_side smol_calendar player_side sys_side sliders_side