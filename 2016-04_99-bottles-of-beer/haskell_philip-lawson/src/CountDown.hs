module CountDown where

type CountDown a = Int -> (Int -> a) -> (Int -> a) -> [a]

type Phrase = Int -> String
type Turn = Int -> String

-- countdown examples
ninetynineBottles :: [String]
ninetynineBottles = countDown 99 bottlesOfBeer noMoreBottles

spaceShip :: [String]
spaceShip = countDown 10 rocket blastOff

-- actual implementation
countDown :: CountDown String
countDown n phrase turn | n < 0     = []
                        | otherwise = go n n phrase turn
    where go start 0 _ turn = [turn start]
          go start n phrase turn = phrase n : go start (n-1) phrase turn


-- Phrases and Turns
bottlesOfBeer :: Phrase
bottlesOfBeer 1 = "1 bottle of beer on the wall, 1 bottle of beer.\n" ++
                  "Take one down and pass it around, no more bottles of beer on the wall.\n"
bottlesOfBeer 2 = "2 bottles of beer on the wall, 2 bottles of beer.\n" ++
                  "Take one down and pass it around, 1 more bottle of beer on the wall.\n"
bottlesOfBeer n = num ++ " bottles of beer on the wall, " ++ num ++ " bottles of beer.\n" ++
                  "Take on down and pass it around, " ++ nextNum ++ " more bottles of beer on the wall\n"
              where num = show n
                    nextNum = show (n-1)

noMoreBottles :: Turn
noMoreBottles n = "No more bottles of beer on the wall, no more bottles of beer.\n" ++ 
                  "Go to the store and buy some more, " ++ bottles n ++ " of beer on the wall.\n"
              where bottles 1 = "1 bottle"
                    bottles n = show n ++ " bottles"

rocket :: Phrase
rocket n = show n ++ "..."

blastOff :: Turn
blastOff _ = "Blastoff!"
