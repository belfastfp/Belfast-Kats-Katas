import Test.QuickCheck
import Test.HUnit
import CountDown
import Data.List

main :: IO ()
main = do 
    runUnitTests 
    runPropertyTests
    
runUnitTests :: IO Counts
runUnitTests = runTestTT $ TestList [twoBottlesOfBeer
                                   , oneBottleOfBeer]  

runPropertyTests :: IO ()
runPropertyTests = mapM_ quickCheck [prop_allCountDownListsLength
                                   , prop_allValidCountDownsEndWithTurn
                                   , prop_allInvalidCountDownListsEmpty
                                   , prop_allPluralBottlesNums
                                   , prop_aboveTwoContainsNoBottle] 
 
-- Property Tests
prop_allCountDownListsLength :: Property
prop_allCountDownListsLength =
    forAll validCountDownStartNums
    (\n -> length (countDown n bottlesOfBeer noMoreBottles) == (n + 1)) 

prop_allValidCountDownsEndWithTurn :: Property
prop_allValidCountDownsEndWithTurn =
    forAll validCountDownStartNums
    (\n -> last (countDown n rocket blastOff) == blastOff n)

prop_allInvalidCountDownListsEmpty :: Property
prop_allInvalidCountDownListsEmpty =
    forAll invalidCountDownStartNums
    (\n -> null (countDown n rocket blastOff))

prop_allPluralBottlesNums :: Property
prop_allPluralBottlesNums =
    forAll bottleVersesGreaterThan2 containsTwoNums
    
prop_aboveTwoContainsNoBottle :: Property
prop_aboveTwoContainsNoBottle =
    forAll validPluralBottleNums
    (not . isInfixOf "bottle " . bottlesOfBeer)

-- Generators 
bottleVersesGreaterThan2 :: Gen (Int, String)
bottleVersesGreaterThan2 = do
    x <- suchThat arbitrary (>=3)
    return (x, bottlesOfBeer x)

validPluralBottleNums :: Gen Int
validPluralBottleNums = suchThat arbitrary (>= 3)

validCountDownStartNums :: Gen Int
validCountDownStartNums = suchThat arbitrary (>= 0)

invalidCountDownStartNums :: Gen Int
invalidCountDownStartNums = suchThat arbitrary (< 0)

-- Helpers
containsTwoNums :: (Int, String) -> Bool
containsTwoNums (n, phrase) = containsNum n phrase && containsNum (n-1) phrase
    where containsNum n = isInfixOf (show n)

-- Unit Tests
twoBottlesOfBeer = TestCase $ assertBool ("When I sing two bottles of beer, \"2 bottles of beer\"" ++ 
                                " should be present, as should \"1 more bottle of beer\"")
                                (isInfixOf "2 bottles" twoBottles &&
                                isInfixOf "1 more bottle " twoBottles)
                    where twoBottles = bottlesOfBeer 2 

oneBottleOfBeer = TestCase $ assertBool ("The verse \"1 bottle of beer\" should not contain" ++
                                        " the number 0")
                                        (notElem '0' $ bottlesOfBeer 1)
