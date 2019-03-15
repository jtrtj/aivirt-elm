module Main exposing (main)

import Aivirt exposing (Question)
import Array exposing (..)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Questions exposing (list)


main =
    Browser.sandbox { init = init, view = view, update = update }


dummyQuestion : Question
dummyQuestion =
    { question = ""
    , correct_answer = ""
    , answers =
        [ ""
        , ""
        , ""
        , ""
        ]
    , image_url = ""
    , image_author = ""
    , image_author_profile = ""
    }


type alias Result =
    { correct : Bool
    , question : Question
    }


type alias Model =
    { questions : Array Question
    , currentQuestionIndex : Int
    , guess : String
    , results : List Result
    }


init : Model
init =
    Model (Array.fromList Questions.list) -1 "" []



-- Update


type Msg
    = GamePlay
    | Answer String


update : Msg -> Model -> Model
update msg model =
    case msg of
        GamePlay ->
            gamePlay model

        Answer guess ->
            checkAnswer model guess


checkAnswer : Model -> String -> Model
checkAnswer model guess =
    if guess == (getCurrentQuestion model).correct_answer then
        { model
            | results = model.results ++ [ Result True (getCurrentQuestion model) ]
            , currentQuestionIndex = model.currentQuestionIndex + 1
        }

    else
        { model
            | results = model.results ++ [ Result False (getCurrentQuestion model) ]
            , currentQuestionIndex = model.currentQuestionIndex + 1
        }


getCurrentQuestion : Model -> Question
getCurrentQuestion model =
    model.questions
    |> Array.get model.currentQuestionIndex
    |> Maybe.withDefault dummyQuestion


gamePlay : Model -> Model
gamePlay model =
    { model | currentQuestionIndex = model.currentQuestionIndex + 1 }



-- View


view : Model -> Html Msg
view model =
    displayGame model


displayGame : Model -> Html Msg
displayGame model =
    if model.currentQuestionIndex < 0 then
        gameStart model

    else if model.currentQuestionIndex < Array.length model.questions then
        getQuestionHero model

    else
        gameEnd model


gameStart game =
    section [ class "hero is-dark is-fullheight" ]
        [ div [ class "hero-body" ]
            [ div [ class "container" ]
                [ h1 [ class "title" ] [ text "Welcome to Aivirt" ]
                , h2 [ class "subtitle" ]
                    [ a [ class "button is-danger is-inverted is-outlined", onClick GamePlay ] [ text "Play today's game" ]
                    ]
                ]
            ]
        ]


getQuestionHero : Model -> Html Msg
getQuestionHero game =
    case Array.get game.currentQuestionIndex game.questions of
        Just question ->
            questionHero question

        Nothing ->
            div [] [ text "There has been an error." ]


questionHero : Question -> Html Msg
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
                                            [ tbody [] (answerButtons question) ]
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


answerButtons : Question -> List (Html Msg)
answerButtons question =
    List.map answerButton question.answers


answerButton : String -> Html Msg
answerButton guess =
    tr []
        [ td []
            [ a [ class "button is-danger is-inverted is-outlined", onClick (Answer guess) ] [ text guess ]
            ]
        ]


gameEnd : Model -> Html Msg
gameEnd game =
    section [ class "hero is-dark is-fullheight" ]
        [ div [ class "container" ]
            [ h2 [ class "subtitle" ]
                [ article [ class "media" ]
                    [ div [ class "media-content" ]
                        [ div [ class "content" ]
                            [ p [ class "title" ]
                                [ text "Game Over!" ]
                            , nav
                                [ class "level is-mobile" ]
                                [ div [ class "level-left" ]
                                    [ resultTable game ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


resultTable : Model -> Html Msg
resultTable game =
    table []
        [ thead []
            [ tr []
                [ th [] [ text "Question" ]
                , th [] [ text "Correct?" ]
                , th [] [ text "Answer" ]
                ]
            ]
        , tbody
            []
            (List.map resultRow game.results)
        ]


resultRow : Result -> Html msg
resultRow result =
    tr []
        [ td [] [ text result.question.question ]
        , td [] [ text (resultSymbol result.correct) ]
        , td [] [ text result.question.correct_answer ]
        ]


resultSymbol : Bool -> String
resultSymbol result =
    if result then
        "✔️"

    else
        "❌"


heroStyle : Question -> List (Attribute msg)
heroStyle question =
    [ class "hero is-fullheight"
    , style "background-image" ("url(" ++ question.image_url ++ ")")
    , style "background-position" "center center"
    , style "background-repeat" "no-repeat"
    , style "background-attachment" "fixed"
    , style "background-size" "cover"
    ]
