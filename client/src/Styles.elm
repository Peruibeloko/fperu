module Styles exposing (..)

import Css exposing (..)
import Css.Global exposing (global, selector)
import Html.Styled exposing (Html)


type alias Theme =
    { fonts :
        { titleSansRegular : List String
        , sansRegular : List String
        , serifRegular : List String
        }
    , colors :
        { main : Color
        , black : Color
        , gray : Color
        , darkGray : Color
        , lisghtGray : Color
        , white : Color
        }
    }


theme : Theme
theme =
    { fonts =
        { titleSansRegular = [ "Fira Sans", .value sansSerif ]
        , sansRegular = [ "PT Sans", .value sansSerif ]
        , serifRegular = [ "Noto Serif", .value serif ]
        }
    , colors =
        { main = rgb 151 39 39
        , black = rgb 24 26 27
        , gray = rgb 93 93 93
        , darkGray = rgb 20 20 20
        , lisghtGray = rgb 160 160 160
        , white = rgb 218 218 218
        }
    }


globalStyles : Html msg
globalStyles =
    global
        [ selector "*"
            [ margin zero
            , padding zero
            , textDecoration none
            , boxSizing borderBox
            , listStyle none
            , backgroundColor theme.colors.black
            , color theme.colors.white
            ]
        ]


headerStyles : List Style
headerStyles =
    [ property "grid-area" "header"
    ]


headerTitle1 : List Style
headerTitle1 =
    [ fontSize (rem 4)
    , fontFamilies theme.fonts.titleSansRegular
    , borderLeft3 (px 10) solid theme.colors.main
    , padding (rem 0.5)
    ]


headerTitle2 : List Style
headerTitle2 =
    [ color theme.colors.gray
    , fontSize (rem 1)
    , fontFamilies theme.fonts.sansRegular
    , margin2 (rem 1) zero
    , whiteSpace pre
    ]


hambButton : List Style
hambButton =
    [ display none
    ]


gridContainer : List Style
gridContainer =
    [ margin (rem 3)
    , property "display" "grid"
    , property "grid-template-areas" """
        'header post navlist'
        'socials post navlist'"""
    ]


isBackdropVisible : Bool -> Style
isBackdropVisible isOpen =
    if isOpen then
        display block

    else
        display Css.none
