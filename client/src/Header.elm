module Header exposing (view)

import Browser
import Html exposing (button, h1, h2, header, text)
import Html.Attributes exposing (id)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { headerText : String
    , hambOpen : Bool
    , subtitle : String
    }


init : Model
init =
    { headerText = "Big Ass Header"
    , subtitle = """Não tenho muita certeza
    sobre o que é tudo isso aqui"""
    , hambOpen = False
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
    header []
        [ h1 [] [ text model.headerText ]
        , h2 [] [ text model.subtitle ]
        , button [ id "hamb", onClick ToggleSidebar ] [ text "≡" ]
        ]
