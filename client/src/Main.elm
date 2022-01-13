module Main exposing (..)

import Browser
import Css exposing (property)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick)
import Styles exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view >> toUnstyled }


type alias Model =
    { isSidebarOpen : Bool
    }


init : Model
init =
    { isSidebarOpen = False
    }


type Msg
    = CloseSidebar
    | OpenSidebar


update : Msg -> Model -> Model
update msg model =
    case msg of
        CloseSidebar ->
            { model | isSidebarOpen = False }

        OpenSidebar ->
            { model | isSidebarOpen = True }


sidebar : Model -> Html Msg
sidebar model =
    aside [ id "socials", css [ isBackdropVisible model.isSidebarOpen ] ]
        [ h1 [] [ text "Redes" ]
        , span [ id "close", onClick CloseSidebar ] [ text "→" ]
        , ul []
            [ a [ href "https://soundcloud.com/dynmic", target "_blank" ]
                [ li [ id "soundcloud" ] [ text "Soundcloud" ] ]
            , a [ href "https://www.instagram.com/dyn.mic", target "_blank" ]
                [ li [ id "instagram" ] [ text "Instagram" ] ]
            , a [ href "https://www.fb.com/dyn.mic.dnb", target "_blank" ]
                [ li [ id "facebook" ] [ text "Facebook" ] ]
            , a [ href "https://www.twitch.tv/dynmicdnb", target "_blank" ]
                [ li [ id "twitch" ] [ text "Twitch" ] ]
            , a [ href "https://twitter.com/dynmicdnb", target "_blank" ]
                [ li [ id "twitter" ] [ text "Twitter" ] ]
            ]
        ]


customHeader : Html Msg
customHeader =
    header [ css headerStyles ]
        [ h1 [ css headerTitle1 ]
            [ a [ title "ibe", href "/" ]
                [ text "Peru" ]
            ]
        , h2 [ css headerTitle2 ]
            [ text "Não tenho muita certeza\nsobre o que é tudo isso aqui" ]
        , button [ onClick OpenSidebar, css hambButton ]
            [ text "≡" ]
        ]


fontUrl : String
fontUrl =
    "https://fonts.googleapis.com/css2?family=Fira+Sans:wght@500&family=Noto+Serif&family=PT+Sans:ital@0;1&display=swap"


view : Model -> Html Msg
view model =
    node "main"
        [ css gridContainer ]
        [ globalStyles
        , node "link" [ href fontUrl, rel "stylesheet" ] []
        , span [ id "backdrop", css [ isBackdropVisible model.isSidebarOpen ] ] []
        , customHeader
        , sidebar model
        ]
