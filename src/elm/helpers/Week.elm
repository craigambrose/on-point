module Helpers.Week exposing (weekStartDay, createContainingDate, allDates)

import Date exposing (Date)
import Date.Extra.Core exposing (daysBackToStartOfWeek)
import Date.Extra.Period as Period

type alias Week = {
  start : Date
}

weekStartDay =
  Date.Mon

createContainingDate : Date -> Week
createContainingDate date =
  let
    daysSinceMonday = daysBackToStartOfWeek (Date.dayOfWeek date) weekStartDay
  in
    { start = Period.add Period.Day -daysSinceMonday date }

allDates : Week -> List Date
allDates week =
  List.map (dayAtIndex week) [0,1,2,3,4,5,6]

dayAtIndex : Week -> Int -> Date
dayAtIndex week index =
  Period.add Period.Day index week.start
