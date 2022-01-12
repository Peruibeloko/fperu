module Styles exposing (..)

import Css exposing (..)


gridContainer : List Style
gridContainer =
    [ margin (rem 3)
    , backgroundColor (rgb 255 0 0)
    ]


sidebarState : Bool -> Style
sidebarState isOpen =
    if isOpen then
        display block

    else
        display Css.none
