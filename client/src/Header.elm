module Header exposing (view)

import Browser
import Html exposing (a, button, h1, h2, header, text)
import Html.Attributes exposing (id, title)
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
view _ =
    header []
        [ h1 []
            [ a
                [ title "ibe" ]
                [ text "Peru" ]
            ]
        , h2 [] [ text """Não tenho muita certeza
    sobre o que é tudo isso aqui""" ]
        , button [ id "hamb", onClick ToggleSidebar ] [ text "≡" ]
        ]
