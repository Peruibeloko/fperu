module Main exposing (..)

import Browser
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick)
import Styles exposing (..)


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


view : Model -> Html Msg
view model =
    div [ css gridContainer ]
        [ span [ id "backdrop" ] []
        , header []
            [ h1 []
                [ a [ title "ibe", href "/" ]
                    [ text "Peru" ]
                ]
            , h2 []
                [ text "Não tenho muita certeza\nsobre o que é tudo isso aqui" ]
            , button [ id "hamb", onClick OpenSidebar ]
                [ text "≡" ]
            ]
        , aside [ id "socials", css [ sidebarState model.isSidebarOpen ] ]
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
        ]
