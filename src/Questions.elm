module Questions exposing (list)

import Aivirt exposing (Question)


list : List Question
list =
    [ questionOne
    , questionTwo
    , questionThree
    , questionFour
    , questionFive
    , questionSix
    , questionSeven
    , questionEight
    , questionNine
    , questionTen
    ]


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


questionThree : Question
questionThree =
    { question = "Former United States President Bill Clinton famously played which instrument?"
    , correct_answer = "Saxophone"
    , answers =
        [ "Baritone horn"
        , "Piano"
        , "Saxophone"
        , "Violin"
        ]
    , image_url = "https://images.unsplash.com/photo-1537704237619-6d30559725c3?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjQxMjM5fQ&s=26c222aad21dc78d88447fe9733b82ac"
    , image_author = "Hosein Amiri"
    , image_author_profile = "https://unsplash.com/@hoseinamiri"
    }


questionFour : Question
questionFour =
    { question = "Which member of \"The Beatles\" narrated episodes of \"Thomas the Tank Engine\"?"
    , correct_answer = "Ringo Starr"
    , answers =
        [ "George Harrison"
        , "Ringo Starr"
        , "John Lennon"
        , "Paul McCartney"
        ]
    , image_url = "https://images.unsplash.com/photo-1496413651143-777c348e8329?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjQxMjM5fQ"
    , image_author = "Luca Bravo"
    , image_author_profile = "https://unsplash.com/@lucabravo"
    }


questionFive : Question
questionFive =
    { question = "When did the CD begin to appear on the consumer market?"
    , correct_answer = "1982"
    , answers =
        [ "1992"
        , "1972"
        , "1982"
        , "1962"
        ]
    , image_url = "https://images.unsplash.com/photo-1475906089153-644d9452ce87?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjQxMjM5fQ"
    , image_author = "chuttersnap"
    , image_author_profile = "https://unsplash.com/@chuttersnap"
    }


questionSix : Question
questionSix =
    { question = "All the following metal elements are liquids at or near room temperature EXCEPT:"
    , correct_answer = "Beryllium"
    , answers =
        [ "Gallium"
        , "Caesium"
        , "Beryllium"
        , "Mercury"
        ]
    , image_url = "https://images.unsplash.com/photo-1447433865958-f402f562b843?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjQxMjM5fQ&s=ba20a0c489c71e83ffe4a4cc7abb507b"
    , image_author = "NASA"
    , image_author_profile = "https://unsplash.com/@nasa"
    }


questionSeven : Question
questionSeven =
    { question = "In the War of the Pacific (1879 - 1883), Bolivia lost its access to the Pacific Ocean after being defeated by which South American country?"
    , correct_answer = "Chile"
    , answers =
        [ "Peru"
        , "Brazil"
        , "Chile"
        , "Argentina"
        ]
    , image_url = "https://images.unsplash.com/photo-1455723576895-6ab1d5abbcb9?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjQxMjM5fQ"
    , image_author = "Cheryl Winn-Boujnida"
    , image_author_profile = "https://unsplash.com/@cbouji"
    }


questionEight : Question
questionEight =
    { question = "Who directed \"E.T. the Extra-Terrestrial\" (1982)?"
    , correct_answer = "Steven Spielberg"
    , answers =
        [ "Stanley Kubrick"
        , "Steven Spielberg"
        , "James Cameron"
        , "Tim Burton"
        ]
    , image_url = "https://images.unsplash.com/photo-1522725539107-ed9cef5284d1?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjQxMjM5fQ&s=168aca1cc1a3417cb79404297d308709"
    , image_author = "Aaron Huber"
    , image_author_profile = "https://unsplash.com/@aahubs"
    }


questionNine : Question
questionNine =
    { question = "Which game was the first time Mario was voiced by Charles Martinet?"
    , correct_answer = "Mario's Game Gallery"
    , answers =
        [ "Mario's Game Gallery"
        , "Super Mario 64"
        , "Mario Tennis"
        , "Dr. Mario 64"
        ]
    , image_url = "https://images.unsplash.com/photo-1507457379470-08b800bebc67?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjQxMjM5fQ"
    , image_author = "Nikita Kachanovsky"
    , image_author_profile = "https://unsplash.com/@nkachanovskyyy"
    }


questionTen : Question
questionTen =
    { question = "What is the main character's name in \"Braid\"?"
    , correct_answer = "Tim"
    , answers =
        [ "Boregard"
        , "Tim"
        , "James"
        , "Jackson"
        ]
    , image_url = "https://images.unsplash.com/photo-1501527410-63b3b08336a6?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjQxMjM5fQ"
    , image_author = "Matty Adame"
    , image_author_profile = "https://unsplash.com/@omgitsmattyvee"
    }
