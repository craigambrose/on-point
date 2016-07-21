module PersonRow exposing (..)
import Html exposing (..)
import Html.App as App

import WeekButtons

-- MODEL

type alias Model = {
  week: WeekButtons.Model
}

init : (Model, Cmd Msg)
init =
  {week = WeekButtons.init} ! []

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
