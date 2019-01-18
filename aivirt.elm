module Aivirt exposing (all)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    Browser.sandbox { init = model, view = view, update = update }


type alias Question =
    { question : String
    , correct_answer : String
    , answers : List String
    , image_url : String
    , image_author : String
    , image_author_profile : String
    }


type alias Game =
    { id : Int
    , date : String
    , questions : List Question
    }


questionOne : Question
questionOne =
    { question = "Nephelococcygia is the practice of doing what?"
    , correct_answer = "Finding shapes in clouds"
    , answers =
        [ "Finding shapes in clouds"
        , "Sleeping with your eyes open"
        , "Breaking glass with your voice"
        , "Swimming in freezing water"
        ]
    , image_url = "https://images.unsplash.com/photo-1496449903678-68ddcb189a24?ixlib"
    , image_author = "Austin Chan"
    , image_author_profile = "https://unsplash.com/@austinchan"
    }


questionTwo : Question
questionTwo =
    { question = "What is the name of the City in Saints Row The Third?"
    , correct_answer = "Steelport"
    , answers =
        [ "Steelport"
        , "Stilwater"
        , "Carcer"
        , "Liberty"
        ]
    , image_url = "https://images.unsplash.com/photo-1499364615650-ec38552f4f34?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjQxMjM5fQ"
    , image_author = "Matthew Kalapuch"
    , image_author_profile = "Matthew Kalapuch"
    }


model : Game
model =
    { id = 1
    , date = "1/18/19"
    , questions =
        [ questionOne
        , questionTwo
        ]
    }
