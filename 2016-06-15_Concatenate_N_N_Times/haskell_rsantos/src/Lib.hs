module Lib where

toString :: String -> String
toString x = x ++ " -> " ++ ( show ( solve x ) ) ++ "\n"

solve :: String -> Maybe String
solve = lengthCheck []

lengthCheck :: String -> String -> Maybe String
lengthCheck "1" [] = Just "1"
lengthCheck x [] = Nothing
lengthCheck [] (x:xs) = lengthCheck [x] xs
lengthCheck subString (x:xs) = let n = read subString :: Int
                                   s = ((n-1)*length(subString))-1
                                   i = length xs
                               in if i == s && patternCheck subString (x:xs)
                                  then Just subString
                                  else if i > s
                                        then lengthCheck (subString++[x]) xs
                                        else Nothing

patternCheck :: String -> String -> Bool
patternCheck _ [] = True
patternCheck pattern input = let (match,tail) = splitAt (length pattern) input
                             in if pattern == match
                                then patternCheck match tail
                                else False 



expand :: Int -> String
expand x = expand_ x (show x)
 where
    expand_ :: Int -> String -> String
    expand_ 0 _ = ""
    expand_ x y = y ++ expand_ (x-1) y 

