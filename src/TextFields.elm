module TextFields exposing (..)
import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main = 
  Browser.sandbox { init = init, update = update, view = view }

-- type alias Model = 
--   { content : String
--   }

-- init : Model
init = 
  { content = "..." }

-- UPDATE

type Msg
  = Change String

-- update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent2 ->
      { model | content = newContent2 }

-- view : Model -> Html Msg
view model = 
  div []
    [ input [ placeholder "enter text...", 
      -- value model.content, 
      onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
    , div [] [ text (String.fromInt(String.length model.content)) ]
    ]
