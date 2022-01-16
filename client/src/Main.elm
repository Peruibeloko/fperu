module Main exposing (..)

import Browser
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


customHeader : Model -> Html Msg
customHeader model =
    header [ css headerStyles ]
        [ h1 [ css headerTitle1 ]
            [ a [ title "ibe", href "/" ]
                [ text "Peru" ]
            ]
        , h2 [ css headerTitle2 ]
            [ text "Não tenho muita certeza\nsobre o que é tudo isso aqui" ]
        , button [ onClick OpenSidebar, css (isBackdropVisible model.isSidebarOpen) ]
            [ text "≡" ]
        ]


fontUrl : String
fontUrl =
    "https://fonts.googleapis.com/css2?family=Fira+Sans:wght@500&family=Noto+Serif&family=PT+Sans:ital@0;1&display=swap"


sidebar : Model -> Html Msg
sidebar model =
    aside [ id "socials", css socials ]
        [ h1 [ css socialsTitle ] [ text "Redes" ]
        , span [ id "close", onClick CloseSidebar, css (isBackdropVisible model.isSidebarOpen) ] [ text "→" ]
        , ul [ css socialsList ]
            [ a [ href "https://soundcloud.com/dynmic", target "_blank", css socialsLinks ]
                [ li [ id "soundcloud", css (socialsListItems Soundcloud) ] [ text "SoundCloud" ] ]
            , a [ href "https://www.instagram.com/dyn.mic", target "_blank", css socialsLinks ]
                [ li [ id "instagram", css (socialsListItems Instagram) ] [ text "Instagram" ] ]
            , a [ href "https://www.fb.com/dyn.mic.dnb", target "_blank", css socialsLinks ]
                [ li [ id "facebook", css (socialsListItems Facebook) ] [ text "Facebook" ] ]
            , a [ href "https://www.twitch.tv/dynmicdnb", target "_blank", css socialsLinks ]
                [ li [ id "twitch", css (socialsListItems Twitch) ] [ text "Twitch" ] ]
            , a [ href "https://twitter.com/dynmicdnb", target "_blank", css socialsLinks ]
                [ li [ id "twitter", css (socialsListItems Twitter) ] [ text "Twitter" ] ]
            ]
        ]


post : Model -> Html Msg
post model =
    article [ css postStyles ]
        [ h1 [ css postTitle ]
            [ text "title" ]
        , header [ css postInfo ]
            [ small [ css postSmall ]
                [ text "author" ]
            , small [ css postSmall ]
                [ text "date" ]
            ]
        , p [ css postContent ]
            [ text "post" ]
        ]


navbar : Model -> Html Msg
navbar model =
    nav [ css navbarStyles ]
        [ ul [ css navbarList ]
            [ li [] [ button [ css navbarButton ] [ text "⇇" ] ]
            , li [] [ button [ css navbarButton ] [ text "←" ] ]
            , li [] [ button [ css navbarButton ] [ text "⤨" ] ]
            , li [] [ button [ css navbarButton ] [ text "→" ] ]
            , li [] [ button [ css navbarButton ] [ text "⇉" ] ]
            ]
        ]


view : Model -> Html Msg
view model =
    node "main"
        [ css gridContainer ]
        [ globalStyles
        , node "link" [ href fontUrl, rel "stylesheet" ] []
        , span [ id "backdrop", css (isBackdropVisible model.isSidebarOpen) ] []
        , customHeader model
        , sidebar model
        , post model
        , navbar model
        ]
