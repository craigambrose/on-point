module WeekButtons exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (style, class)
import Html.Events exposing (onClick)
import Date.Extra.Create exposing (dateFromFields)
import Date.Extra.Period
import Date exposing (..)

import DayButton

-- MODEL

type alias Model = {
  days: List IndexedDayButton
}

type alias IndexedDayButton = {
  id : Int,
  model : DayButton.Model
}

init : Model
init =
    let
      startDate = dateFromFields 2016 Jan 1 0 0 0 0
    in
      {
        days = [
          initIndexedDayButton startDate 0,
          initIndexedDayButton startDate 1,
          initIndexedDayButton startDate 2,
          initIndexedDayButton startDate 3,
          initIndexedDayButton startDate 4,
          initIndexedDayButton startDate 5,
          initIndexedDayButton startDate 6
        ]
      }

initIndexedDayButton startDate index =
  IndexedDayButton index (DayButton.init (Date.Extra.Period.add Date.Extra.Period.Day index startDate))

-- UPDATE

type Msg =
  Modify Int DayButton.Msg

update : Msg -> Model -> Model
update action model =
  case action of
    Modify id msg ->
      { model | days = List.map (updateHelp id msg) model.days }

updateHelp : Int -> DayButton.Msg -> IndexedDayButton -> IndexedDayButton
updateHelp targetId msg {id, model} =
  IndexedDayButton id (if targetId == id then DayButton.update msg model else model)


-- VIEW

view : Model -> Html Msg
view model =
  let
    dayButtons = List.map viewIndexedDayButton model.days
  in
    div [ class "btn-group" ] dayButtons

viewIndexedDayButton : IndexedDayButton -> Html Msg
viewIndexedDayButton {id, model} =
  App.map (Modify id) (DayButton.view model)
