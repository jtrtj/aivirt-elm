module Main exposing (main)

import Browser
import Dict exposing (Dict)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    Browser.sandbox { init = init, view = view, update = update }


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
    , currentQuestion : Int
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


init : Game
init =
    { id = 1
    , date = "1/18/19"
    , questions =
        [ questionOne
        , questionTwo
        ]
    , currentQuestion = 0
    }


gameQuestions : Game -> Dict Int Question
gameQuestions game =
    List.indexedMap Tuple.pair game.questions
        |> Dict.fromList


type Msg
    = StartGame
    | NextQuestion Game


update : Msg -> Game -> Game
update msg model =
    case msg of
        StartGame ->
            model

        NextQuestion game ->
            { game | currentQuestion = game.currentQuestion + 1 }


view : Game -> Html Msg
view model =
    div []
        [ div [] [ getQuestion (gameQuestions model) model.currentQuestion ]
        , div [] [ button [ onClick (NextQuestion model) ] [ text "next" ] ]
        ]


getQuestion : Dict Int Question -> Int -> Html msg
getQuestion questions index =
    case Dict.get index questions of
        Just question ->
            questionHero question

        Nothing ->
            gameStart


questionHero : Question -> Html msg
questionHero question =
    section (heroStyle question)
        [ div [ class "hero-body" ]
            [ div [ class "container" ]
                [ h2 [ class "subtitle" ]
                    [ article [ class "media" ]
                        [ div [ class "media-content" ]
                            [ div [ class "content" ]
                                [ p [ class "title" ]
                                    [ text question.question ]
                                , nav
                                    [ class "level is-mobile" ]
                                    [ div [ class "level-left" ]
                                        [ table []
                                            (answerButtons question)
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        , div
            [ class "hero-foot" ]
            [ nav [ class "tabs is-boxed is-fullwidth" ]
                [ div [ class "container" ]
                    [ ul []
                        [ li []
                            [ a [ href question.image_author_profile, target "blank" ] [ text ("Image by:" ++ question.image_author) ]
                            , li [] [ a [ href "https://unsplash.com/developers", target "blank" ] [ text "Provided by: Unsplash" ] ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


answerButtons : Question -> List (Html msg)
answerButtons question =
    List.map answerButton question.answers


answerButton : String -> Html msg
answerButton answer =
    tr []
        [ td []
            [ a [ class "button is-danger is-inverted is-outlined" ] [ text answer ]
            ]
        ]


heroStyle : Question -> List (Attribute msg)
heroStyle question =
    [ class "hero is-fullheight"
    , style "background-image" ("url(" ++ question.image_url ++ ")")
    , style "background-position" "center center"
    , style "background-repeat" "no-repeat"
    , style "background-attachment" "fixed"
    , style "background-size" "cover"
    ]


gameStart =
    section [ class "hero is-dark is-fullheight" ]
        [ div [ class "hero-body" ]
            [ div [ class "container" ]
                [ h1 [ class "title" ] [ text "Welcome to Aivirt" ]
                , h2 [ class "subtitle" ]
                    [ a [ class "button is-danger is-inverted is-outlined" ] [ text "Play today's game" ]
                    ]
                ]
            ]
        ]
