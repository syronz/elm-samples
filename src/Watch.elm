module Watch exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Task
import Time



-- MAIN


main =
  Browser.element
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model =
  { zone : Time.Zone
  , time : Time.Posix
  , status : String
  }


init : () -> (Model, Cmd Msg)
init _ =
  ( Model Time.utc (Time.millisToPosix 0) "Running"
  , Cmd.none
  -- , Task.perform AdjustTimeZone Time.here
  )



-- UPDATE


type Msg
  = Tick Time.Posix
  | AdjustTimeZone Time.Zone
  | Stop
  | Start



update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime ->
      ( { model | time = newTime }
      , Cmd.none
      )

    AdjustTimeZone newZone ->
      ( { model | zone = newZone }
      , Cmd.none
      )

    Stop ->
      ({ model | status = "Stoped" }
      , Cmd.none
      )
    Start ->
      ({ model | status = "Running" }
      , Cmd.none
      )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  if model.status == "Running" then
    Time.every 1000 Tick
  else
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
  let
    hour   = String.fromInt (Time.toHour   model.zone model.time)
    minute = String.fromInt (Time.toMinute model.zone model.time)
    second = String.fromInt (Time.toSecond model.zone model.time)
    entitle = "Created by Diako Amir"
  in
  div [] 
  [ h1 [] [ text (hour ++ ":" ++ minute ++ ":" ++ second) ]
  , h1 [] [ text model.status ]
  , button [ style "font-size" "30px", onClick Stop ] [ text "stop" ]
  , button [ style "font-size" "30px", onClick Start ] [ text "start" ]
  , p [] [ text entitle ]
  ]
