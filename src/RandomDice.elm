module RandomDice exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Random



-- MAIN


main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }



-- MODEL


type alias Model =
  { dieFace : Int
  }


init : () -> (Model, Cmd Msg)
init _ =
  ( Model 3
  , Cmd.none
  )



-- UPDATE


type Msg
  = Roll
  | NewFace Int


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      ( model
      , Random.generate NewFace (Random.int 1 6)
      )

    NewFace newFace ->
      ( Model newFace
      , Cmd.none
      )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text (String.fromInt model.dieFace) ]
    , button [ onClick Roll ] [ text "Roll" ]
    , viewSurpirze model
    , h1 [] [ text "................." ]
    ]

viewSurpirze : Model -> Html Msg
viewSurpirze model =
  case model.dieFace of
    6 ->
      (h1 [ style "color" "red" ] [ text "You Won!" ])
    _ ->
      h1 [] []

  -- if model.dieFace > 5 then
  --   h1 [ style "color" "red" ] [ text "You Won!" ]
  -- else
  --   h1 [] []






