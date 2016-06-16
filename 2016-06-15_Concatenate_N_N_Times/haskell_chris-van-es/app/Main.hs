module Main where

import Lib
import System.IO
import System.Environment

main :: IO ()
main = do
  args <- getArgs
  let text = head args
  let pattern = show $ findRepeatedNumber text
  let patternLength = show $ div (length text) (numberOfRepeatedDigits text)
  if repeatedPatternValid text
    then putStrLn $ "Pattern " ++ pattern ++ " repeated " ++ patternLength ++ " times"
    else putStrLn "Invalid pattern"
