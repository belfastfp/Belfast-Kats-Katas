module Lib (findRepeatedNumber, numberOfRepeatedDigits, repeatedPatternValid) where

findRepeatedNumber text = take (numberOfRepeatedDigits text) text
numberOfRepeatedDigits text = ceiling $ logBase 10 (fromIntegral (length text))
repeatedPatternValid text = text == concat [(findRepeatedNumber text) | i <- [1..(read $ findRepeatedNumber text)]]
