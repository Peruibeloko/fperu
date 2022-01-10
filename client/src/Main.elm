module Main exposing (..)

import Browser
import Html exposing (a, aside, button, div, h1, h2, header, li, span, text, ul)
import Html.Attributes exposing (class, href, id, target, title)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { hambOpen : Bool
    }


init : Model
init =
    { hambOpen = False
    }


type Msg
    = ToggleSidebar


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleSidebar ->
            { model | hambOpen = not model.hambOpen }


view : Model -> Html.Html Msg
view model =
    div [ class "grid-container" ]
        [ span [ id "backdrop" ] []
        , header []
            [ h1 []
                [ a [ title "ibe", href "/" ]
                    [ text "Peru" ]
                ]
            , h2 []
                [ text "Não tenho muita certeza\nsobre o que é tudo isso aqui" ]
            , button [ id "hamb", onClick ToggleSidebar ]
                [ text "≡" ]
            ]
        , aside [ id "socials" ]
            [ h1 [] [ text "Redes" ]
            , span [ id "close" ] [ text "←" ]
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
        ]
