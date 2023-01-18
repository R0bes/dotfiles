module My.Layouts where

import My.Colors

import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed as XLR
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation
import XMonad.Layout.ShowWName
import XMonad.Layout.Tabbed
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)

myTabTheme = def { 
      activeColor = colorGreen,
      inactiveColor = colorBase,
      urgentColor = colorRed,
      activeBorderColor = colorBase,
      inactiveBorderColor = colorBase,
      urgentBorderColor = colorRed,
      activeTextColor = colorBase,
      inactiveTextColor = colorFlamingo,
      urgentTextColor = colorBase,
      fontName = "xft:Sugar Snow:size=12"
    } 


mySpacing i = spacingRaw False (Border 10 10 10 10) True (Border i i i i) True

tabs    = renamed [XLR.Replace "Tabs"]
          $ avoidStruts
          $ tabbed shrinkText myTabTheme

tall    = renamed [XLR.Replace "Tall"] 
          $ limitWindows 5
          $ smartBorders
          $ windowNavigation
          $ addTabs shrinkText myTabTheme
          $ subLayout [] tabs
          $ mySpacing 4
          $ ResizableTall 1 (3/100) (1/2) []

full    = renamed [XLR.Replace "Monocle"] 
          $ noBorders Full

myLayout = tall ||| full


myLayoutHook = avoidStruts $ myLayout