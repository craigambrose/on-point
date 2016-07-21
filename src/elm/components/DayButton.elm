module Components.DayButton exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, class)
import Html.Events exposing (onClick)
import Date exposing (..)

-- MODEL

type State = Default | Danger | Warning | Success
type alias Model = {
  date : Date,
  state : State
}

-- initialModel : Model
-- initialModel =
--     Default

init : Date -> Model
init date =
  {
    date = date,
    state = Default
  }

-- UPDATE

type Msg
    = Cycle

update : Msg -> Model -> Model
update action model =
    case action of
      Cycle ->
        {model | state = cycleType model.state}

cycleType : State -> State
cycleType state =
  case state of
    Default -> Success
    Danger -> Default
    Warning -> Danger
    Success -> Warning

-- VIEW

view : Model -> Html Msg
view model =
  let name = toString (Date.dayOfWeek model.date)
  in
    button [ class ("btn " ++ stateClass model.state), onClick Cycle ] [ text name ]

stateClass state =
  case state of
    Default -> "btn-default"
    Danger -> "btn-danger"
    Warning -> "btn-warning"
    Success -> "btn-success"
