module Main exposing (..)

import ElmTest exposing (..)
import Helpers.WeekTest exposing (all)


allTests : Test
allTests =
    suite "All tests"
        [ Helpers.WeekTest.all
        ]

main : Program Never
main =
    runSuiteHtml allTests
