module Bottles.Tests where

import Test.HUnit
import Bottles

testLength :: Test
testLength = TestCase (assertEqual "length not ok" (length lyrics) 11786)

testLineCount :: Test
testLineCount = TestCase (assertBool "line count not ok" (length (lines lyrics) == 200) )

tests :: Test
tests = TestList [testLength, TestLabel "Count lines" testLineCount]
