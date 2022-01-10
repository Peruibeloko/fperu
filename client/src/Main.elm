module Main exposing (view)

import Browser
import Header exposing (view)
import Html exposing (button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)



-- import Sidebar exposing (..)
-- import Post exposing (..)
-- import Footer exposing (..)


main : Program () Int Msg
main =
    Browser.sandbox { init = 0, update = update, view = view }


type Msg
    = Increment
    | Decrement


update : Msg -> number -> number
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


view : Int -> Html.Html Msg
view model =
    Header.view
        div
        []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]
