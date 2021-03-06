module Main exposing (..)

import Components.PersonRow exposing (init, update, view)
import Html.App as Html


main : Program Never
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
