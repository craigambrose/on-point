module DayButton exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, class)
import Html.Events exposing (onClick)

-- MODEL

type Model = Default | Danger | Warning | Success

-- initialModel : Model
-- initialModel =
--     Default

init : Model
init =
    Default

-- UPDATE

type Msg
    = Cycle

update : Msg -> Model -> Model
update action model =
    case action of
      Cycle ->
        cycleType model

cycleType state =
  case state of
    Default -> Success
    Danger -> Default
    Warning -> Danger
    Success -> Warning

-- VIEW

view : Model -> Html Msg
view model =
    button [ class ("btn " ++ stateClass model), onClick Cycle ] [ text "Day" ]

stateClass state =
  case state of
    Default -> "btn-default"
    Danger -> "btn-danger"
    Warning -> "btn-warning"
    Success -> "btn-success"
