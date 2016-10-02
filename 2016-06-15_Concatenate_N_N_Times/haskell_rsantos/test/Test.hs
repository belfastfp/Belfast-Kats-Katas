module Main where


import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
    describe "Concatenate N N times" $ do
    
      it "should match 7 x 7s" $ do
        (solve "7777777") `shouldBe` (Just "7")

      it "should not match 8 x 7s" $ do
        (solve "77777777") `shouldBe` Nothing

      it "should match 12 x 12s" $ do
        (solve "121212121212121212121212") `shouldBe` (Just "12")

      it "should not match 11 x 12s" $ do
        (solve "1212121212121212121212") `shouldBe` Nothing

      it "should match 100 x 100s" $ do
        let patternToTest = "100100100100100100100100100100100100100100100\
          \100100100100100100100100100100100100100100100100100100100100100\
          \100100100100100100100100100100100100100100100100100100100100100\
          \100100100100100100100100100100100100100100100100100100100100100\
          \100100100100100100100100100100100100100100100100100100100100100100"
        (solve patternToTest) `shouldBe` (Just "100")

      it "should not match 99 x 100s" $ do
        let patternToTest = "100100100100100100100100100100100100100100100\
          \100100100100100100100100100100100100100100100100100100100100100\
          \100100100100100100100100100100100100100100100100100100100100100\
          \100100100100100100100100100100100100100100100100100100100100100\
          \100100100100100100100100100100100100100100100100100100100100100"
        (solve patternToTest) `shouldBe` Nothing

      it "should match 9000000 x 9000000s" $ do
        let patternToTest = expand 9000000
        (solve patternToTest) `shouldBe` (Just "9000000")
