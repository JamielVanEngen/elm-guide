module Main exposing (main, update, view)
import Browser exposing (..)
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
    Browser.sandbox { init = init, view = view, update = update }


-- Model
type alias Model = Int

init : Model
init = 0

type Msg = Increment | IncrementTen | Decrement | DecrementTen | Reset

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1
        IncrementTen ->
            model + 10
        Decrement ->
            model - 1
        DecrementTen ->
            model - 10
        Reset ->
            init

view : Model -> Html Msg
view model =
    div []
    [ button [onClick DecrementTen] [text "- 10"],
    button [onClick Decrement] [text "-"],
    div [] [text (String.fromInt model) ], 
    button [onClick Increment] [text "+"], 
    button [onClick IncrementTen] [text "+ 10"],
    button [onClick Reset] [text "Reset"]
    ]

