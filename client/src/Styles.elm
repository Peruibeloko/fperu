module Styles exposing (gridContainer)

import Css exposing (Style, backgroundColor, margin, rem, rgb)


gridContainer : Style
gridContainer =
    Css.batch
        [ margin (rem 3)
        , backgroundColor (rgb 255 0 0)
        ]
