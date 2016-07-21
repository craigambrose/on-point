module Components.PersonRow exposing (..)

import Html exposing (..)
import Html.App as App
import Date
import Date.Extra.Create exposing (dateFromFields)
import Components.WeekButtons as WeekButtons

-- MODEL

type alias Model = {
  week: WeekButtons.Model
}

init : (Model, Cmd Msg)
init =
  let
    startDate = dateFromFields 2016 Date.Jan 1 0 0 0 0
  in
    {week = WeekButtons.init startDate} ! []

-- UPDATE

type Msg =
  CurrentWeek WeekButtons.Msg

update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  case action of
    CurrentWeek msg ->
      ({ model | week = WeekButtons.update msg model.week}, Cmd.none)

-- VIEW

view : Model -> Html Msg
view model =
    div [] [
      span [] [ text "Craig A." ],
      App.map CurrentWeek (WeekButtons.view model.week)
    ]
