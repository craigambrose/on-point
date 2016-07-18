module DayButton exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, class)
import Html.Events exposing (onClick)

-- MODEL

type State = Default | Danger | Warning | Success
type alias Model = {
  name : String,
  state : State
}

-- initialModel : Model
-- initialModel =
--     Default

init : String -> Model
init name =
  {
    name = name,
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
    button [ class ("btn " ++ stateClass model.state), onClick Cycle ] [ text model.name ]

stateClass state =
  case state of
    Default -> "btn-default"
    Danger -> "btn-danger"
    Warning -> "btn-warning"
    Success -> "btn-success"
