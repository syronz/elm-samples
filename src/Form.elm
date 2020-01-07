module Form exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Char exposing (isDigit, isUpper, isLower)

main = 
  Browser.sandbox { init = init, update = update, view = view }


type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  }

init : Model
init = 
  Model "" "" ""

type Msg
  = Name String
  | Password String
  | PasswordAgain String


update : Msg -> Model -> Model
update msg model = 
  case msg of
    Name name ->
      { model | name = name }
    
    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }


view : Model -> Html Msg
view model = 
  div []
    [ viewInput "text" "Name" model.name Name
    , viewInput "password" "Password" model.password Password
    , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
    , viewValidation model
    -- , div [] [ text model.name ]
    -- , div [] [ text model.password ]
    -- , div [] [ text model.passwordAgain ]
    , viewResult model
    , viewSimple
    ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []


viewValidation : Model -> Html msg
viewValidation model = 
  if not ( String.any isUpper model.password) then
    div [ style "color" "red" ] [ text "Password should at least has one upper char" ]

  else if String.length model.password < 8 then
    -- Debug.log (String.concat ["diako", "ako", "makwan"])
    div [ style "color" "red" ] [ text "Password should be more than 8 characters" ]

  else if not ( String.any isLower model.password) then
    div [ style "color" "red" ] [ text "Password should at least has one lower char" ]
  else if not ( String.any isDigit model.password) then
    div [ style "color" "red" ] [ text "Password should at least has one digit" ]


  else 
    if model.password == model.passwordAgain then
      div [ style "color" "green" ] [ text "ok" ]
    else
      div [ style "color" "red" ] [ text "Password do not match" ]

viewResult : Model -> Html msg
viewResult model =
  div [ style "color" "maroon" ] [ text model.password ]

viewSimple = 
  div [ style "border" "3px solid red" ] [ text "THIS IS SAMPLE" ]




