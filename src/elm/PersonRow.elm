module PersonRow exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (style, class)
import Html.Events exposing (onClick)

import DayButton

-- MODEL

type alias Model = {
  mon: DayButton.Model,
  tue: DayButton.Model
}

init : (Model, Cmd Msg)
init =
    ({
      mon = DayButton.init "Mon",
      tue = DayButton.init "Tue"
    }, Cmd.none)

-- UPDATE

type Msg =
  Mon DayButton.Msg |
  Tue DayButton.Msg

update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  case action of
    Mon msg ->
      ({ model | mon = DayButton.update msg model.mon }, Cmd.none)
    Tue msg ->
      ({ model | tue = DayButton.update msg model.tue }, Cmd.none)

-- VIEW

view : Model -> Html Msg
view model =
    div [] [
      span [] [ text "Craig A." ],
      div [ class "btn-group" ] [
        App.map Mon (DayButton.view model.mon),
        App.map Tue (DayButton.view model.tue)
      ]
    ]
