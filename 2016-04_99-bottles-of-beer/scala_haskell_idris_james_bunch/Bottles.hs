module Bottles where 
import           Data.Char

main :: IO()
main = putStrLn lyrics

quantity :: Int -> String
quantity (-1) = "99 bottles of beer"
quantity 0 = "no more bottles of beer"
quantity 1 = "1 bottle of beer"
quantity x = show x ++ " bottles of beer"

action :: Int -> String
action 0 = "Go to the store and buy some more"
action _ = "Take one down and pass it around"

capitalise :: String -> String
capitalise s = toUpper (head s) : tail s

lyrics :: String
lyrics = [99,98..0] >>= verse
    where verse x = capitalise (quantity x) ++ " on the wall, " ++ quantity x ++ ".\n"
                    ++ action x ++ ", " ++ quantity (x-1) ++ " on the wall.\n"
