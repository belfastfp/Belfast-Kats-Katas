module Main where

import System.IO
import System.Environment

import Lib

main :: IO()
main = do
 args <- getArgs
 putStrLn $ foldr (\a b -> (toString a)++b ) "" args

