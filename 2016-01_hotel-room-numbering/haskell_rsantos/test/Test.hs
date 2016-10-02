module Main where


import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
    describe "Hotel Room Kata" $ do
    
      it "should match 111" $ do
        (solve room111) `shouldBe` (Just "111")

      it "should match 311" $ do
        (solve room311) `shouldBe` (Just "311")

      it "should match 135" $ do
        (solve room135) `shouldBe` (Just "135")

      it "should match 911" $ do
        (solve room911) `shouldBe` (Just "911")

      it "should match 523" $ do
        (solve room523) `shouldBe` (Just "523")

      it "should match 281" $ do
        (solve room281) `shouldBe` (Just "281")

      it "should match 999" $ do
        (solve room999) `shouldBe` (Just "999")



room111 = 
  "*"

room311 =
  "#  #  *  #  #"

room135 = 
  "#####\n\
  \#####\n\
  \####*\n\
  \#####\n\
  \#####"

room911 = 
  "         #####\n\
  \         #####           ######\n\
  \         #####           ######\n\
  \#  #  #  #####  #  #  #  ######  *"

room523 =
  "#\n\
  \#  #\n\
  \#  #  ##\n\
  \#  #  ##  ###\n\
  \#  #  ##  ###  #####\n\
  \#  #  ##  ###  ##*##  ########\n\
  \#  #  ##  ###  #####  ########"

room281 = 
  "           #\n\
  \           *\n\
  \           #\n\
  \           #\n\
  \           #\n\
  \           #\n\
  \           #\n\
  \           #\n\
  \#########  #  #"

room999 = 
  "                        ########*\n\
  \                        #########\n\
  \                        #########\n\
  \                        #########\n\
  \                        #########\n\
  \                        #########\n\
  \                        #########\n\
  \                        #########\n\
  \#  #  #  #  #  #  #  #  #########"

