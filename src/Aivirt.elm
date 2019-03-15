module Aivirt exposing (Question)

import Http
import Json.Decode exposing (Decoder, field, string)



-- Game


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


type Model
    = Failure
    | Loading
    | Success String
