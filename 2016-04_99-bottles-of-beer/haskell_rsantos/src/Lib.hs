module Lib where

sayBottles :: Int -> String
sayBottles 0 = "no more bottles"
sayBottles 1 = "1 bottle"
sayBottles n = (show n)++" bottles"

songLine :: Int -> String
songLine 0 = "No more bottles of beer on the wall, no more bottles of beer.\n\
             \Go to the store and buy some more, 99 bottles of beer on the wall.\n\n"
songLine n = (sayBottles n)++" of beer on the wall, "++(sayBottles n)++" of beer.\n\
             \Take one down and pass it around, "++(sayBottles (n-1))++" of beer on the wall.\n\n"


-- recursive version --
songR :: Int -> String
songR 0 = songLine 0
songR n = (songLine n) ++ (songR (n-1))

-- list comprehension version
songLC :: Int -> String
songLC n =  concat [ songLine x | x <- [n,(n-1)..0] ]

-- list version
songL :: Int -> String
songL n = concat $ map songLine $ [n,(n-1)..0]


startSongR :: String
startSongR = songR 99
