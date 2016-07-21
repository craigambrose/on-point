module Helpers.WeekTest exposing (..)

import ElmTest exposing (..)
import Helpers.Week as Week
import Date
import Date.Extra.Create exposing (dateFromFields)

createContainingDateSuit : Test
createContainingDateSuit =
  suite "Create a week from a containing date"
   [ test "from Monday" (assertEqual (jan2016 4) (Week.createContainingDate (jan2016 4)).start)
   , test "from Tuesday" (assertEqual (jan2016 4) (Week.createContainingDate (jan2016 5)).start)
   ]

allDates : Test
allDates =
  suite "Get a list of all dates in the week"
   [ test "contains expected dates" (assertEqual [
       jan2016 4,
       jan2016 5,
       jan2016 6,
       jan2016 7,
       jan2016 8,
       jan2016 9,
       jan2016 10
     ] (Week.allDates firstWeek))]

firstWeek =
  Week.createContainingDate (jan2016 4)

jan2016 day =
  dateFromFields 2016 Date.Jan day 0 0 0 0

all : Test
all =
  suite "Week tests"
      [ createContainingDateSuit, allDates ]
