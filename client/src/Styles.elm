module Styles exposing (..)

import Css exposing (..)
import Css.Global exposing (global, selector)
import Css.Transitions exposing (easeInOut, transition)
import Html.Styled exposing (Html)


type alias Theme =
    { fonts :
        { sansTitle : List String
        , sansRegular : List String
        , serifRegular : List String
        }
    , colors :
        { main : Color
        , black : Color
        , gray : Color
        , darkGray : Color
        , lightGray : Color
        , white : Color
        }
    }


theme : Theme
theme =
    { fonts =
        { sansTitle = [ "Fira Sans", .value sansSerif ]
        , sansRegular = [ "PT Sans", .value sansSerif ]
        , serifRegular = [ "Noto Serif", .value serif ]
        }
    , colors =
        { main = rgb 151 39 39
        , black = rgb 24 26 27
        , gray = rgb 93 93 93
        , darkGray = rgb 20 20 20
        , lightGray = rgb 160 160 160
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
    , fontFamilies theme.fonts.sansTitle
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


socials : List Style
socials =
    [ property "grid-area" "socials"
    , margin2 (rem 2) zero
    ]


socialsTitle : List Style
socialsTitle =
    [ fontSize (rem 2.5)
    , fontFamilies theme.fonts.sansTitle
    ]


socialsList : List Style
socialsList =
    [ displayFlex
    , flexDirection column
    ]


socialsLinks : List Style
socialsLinks =
    [ property "width" "min-content" ]


type Social
    = Soundcloud
    | Instagram
    | Facebook
    | Twitch
    | Twitter


socialsListItems : Social -> List Style
socialsListItems social =
    [ cursor pointer
    , fontFamilies theme.fonts.sansRegular
    , fontSize (rem 1)
    , color theme.colors.white
    , borderLeft3 (px 5) solid (socialLinkColor social)
    , padding (rem 0.5)
    , margin2 (rem 0.5) zero
    , hover
        [ borderWidth (rem 1)
        ]
    , transition
        [ Css.Transitions.borderWidth3 200 0 easeInOut ]
    ]


socialLinkColor : Social -> Color
socialLinkColor social =
    case social of
        Soundcloud ->
            hex "ff5500"

        Instagram ->
            hex "dd2a7b"

        Facebook ->
            hex "2d88ff"

        Twitch ->
            hex "9147ff"

        Twitter ->
            hex "1da1f2"


navbarStyles : List Style
navbarStyles =
    [ property "justify-self" "end"
    , property "grid-area" "navlist"
    , position fixed
    , margin2 (rem 2) zero
    ]


navbarList : List Style
navbarList =
    [ displayFlex
    , flexDirection column
    , alignItems flexEnd
    ]


navbarButton : List Style
navbarButton =
    [ cursor pointer
    , fontFamilies theme.fonts.sansRegular
    , fontSize (rem 1.5)
    , textAlign right
    , color theme.colors.white
    , borderStyle none
    , borderRight3 (px 5) solid theme.colors.main
    , padding (rem 0.5)
    , margin2 (rem 0.5) zero
    , hover
        [ borderWidth (rem 1) ]
    , transition
        [ Css.Transitions.borderWidth3 200 0 easeInOut
        ]
    ]


postStyles : List Style
postStyles =
    [ property "justify-self" "center"
    , property "grid-area" "post"
    , width (pct 60)
    ]


postTitle : List Style
postTitle =
    [ fontSize (rem 3)
    , fontFamilies theme.fonts.sansTitle
    , borderLeft3 (px 7) solid theme.colors.main
    , padding (rem 0.5)
    ]


postInfo : List Style
postInfo =
    [ margin2 (rem 1) zero ]


postSmall : List Style
postSmall =
    [ fontFamilies theme.fonts.sansRegular
    , fontSize (rem 1)
    , color (rgb 93 93 93)
    , fontStyle italic
    , display block
    ]


postContent : List Style
postContent =
    [ fontSize (rem 1)
    , fontFamilies theme.fonts.sansRegular
    , margin (rem 1)
    , padding (rem 1)
    , backgroundColor theme.colors.darkGray
    , border3 (px 3) solid (rgba 255 255 255 0.4)
    , borderRadius (rem 1)
    ]


gridContainer : List Style
gridContainer =
    [ margin (rem 3)
    , property "display" "grid"
    , property "grid-template-areas" """
        'header post navlist'
        'socials post navlist'"""
    ]


isBackdropVisible : Bool -> List Style
isBackdropVisible isOpen =
    if isOpen then
        [ display block ]

    else
        [ display Css.none ]
