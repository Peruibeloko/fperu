module Styles exposing (..)

import Css exposing (..)
import Css.Global exposing (class, global, selector)
import Html.Styled exposing (Html)


commonTheme =
    { titleSansRegular = fontFamilies [ "Fira Sans", "sans-serif" ]
    , sansRegular = fontFamilies [ "PT Sans", "sans-serif" ]
    , serifRegular = fontFamilies [ "Noto Serif", "serif" ]
    , mainColor = rgb 151 39 39
    , black = rgb 24 26 27
    , gray = rgb 93 93 93
    , darkGray = rgb 20 20 20
    , lisghtGray = rgb 160 160 160
    , white = rgb 218 218 218
    }


gridContainer : List Style
gridContainer =
    [ margin (rem 3)
    , property "display" "grid"
    , property "grid-template-areas" """
        'header post navlist'
        'socials post navlist'"""
    ]


headerStyles : List Style
headerStyles =
    [ margin (rem 3)
    , property "display" "grid"
    , property "grid-template-areas" """
        'header post navlist'
        'socials post navlist'"""
    ]


globalStyles : Html msg
globalStyles =
    global
        [ selector "*"
            [ margin zero
            , padding zero
            , textDecoration none
            , boxSizing borderBox
            , listStyle none
            , backgroundColor commonTheme.black
            , color commonTheme.white
            ]
        ]


sidebarState : Bool -> Style
sidebarState isOpen =
    if isOpen then
        display block

    else
        display Css.none
