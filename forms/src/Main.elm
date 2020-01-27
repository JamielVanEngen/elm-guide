module Main exposing (main, update, view)
import Browser exposing (..)
import Html exposing (Html, button, div, text, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
    Browser.sandbox { init = init, view = view, update = update }


-- Model
type alias Model =
    {
        name: String,
        password: String,
        passwordAgain: String
    }

init : Model
init = Model "" "" ""

type Msg =
    Name String |
    Password String |
    PasswordAgain String

update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }
        Password password ->
            { model | password = password }
        PasswordAgain passwordAgain ->
            { model | passwordAgain = passwordAgain }

view : Model -> Html Msg
view model =
    div []
    [ 
        viewInput "text" "Name" model.name Name,
        viewInput "password" "Password" model.password Password,
        viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain,
        viewValidation model
    ]

viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg = 
    input [ type_ t, placeholder p, value v, onInput toMsg ] []

viewValidation : Model -> Html msg
viewValidation model =
    if model.password == model.passwordAgain then
        div [style "color" "green"] [text "OK"]
    else
        div [style "color" "red"] [text "Passwords do not match!"]