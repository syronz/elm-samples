module Convert exposing(..)
import Browser
import Html exposing (Html, Attribute, span, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { input : String
  , inch: String
  }


init : Model
init =
  { input = "", inch = "" }



-- UPDATE


type Msg
  = Change String
  | Inch String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newInput ->
      { model | input = newInput }

    Inch newInput ->
      { model | inch = newInput }



-- VIEW

view : Model -> Html Msg
view model = 
  div []
    [ text "Welcome to convertor"
    , viewCelcius model
    , viewInch model
    ]

viewCelcius : Model -> Html Msg
viewCelcius model =
  case String.toFloat model.input of
    Just celsius ->
      viewConverter  " °C = " "°F" model.input Change "blue" (String.fromFloat (celsius * 1.8 + 32)) ""

    Nothing ->
      viewConverter " °C = " "°F" model.input  Change"red" "???" "1px solid red"


viewInch : Model -> Html Msg
viewInch model = 
  case String.toFloat model.inch of
    Just inch ->
      viewConverter " Inch = " "cm" model.inch Inch "green" (String.fromFloat (inch / 2.5)) ""

    Nothing ->
      viewConverter " Inch = " "cm" model.inch Inch "orange" "xxx" "1px soid red"


viewConverter : String -> String -> String -> (String -> Msg) -> String -> String -> String -> Html Msg
viewConverter source destination userInput toMsg color equivalentTemp b =
  div []
    [ div[] [input [ value userInput, onInput toMsg, style "width" "40px" ] []
      , text source
      , span [ style "color" color, style "border" b ] [ text equivalentTemp ]
      , text destination
      ]
    ]



