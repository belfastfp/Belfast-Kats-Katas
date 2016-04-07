import Data.Vect

Verse : Type
Verse = (String,String)

Song : Type
Song = Vect 10 Verse

Song2 : Nat -> Type
Song2 n = Vect n Verse

quantity : Nat -> String
quantity Z = "no more bottles of beer"
quantity (S Z) = "1 bottle of beer"
quantity x = show x ++ " bottles of beer"

action : Nat -> String
action Z = "Go to the store and buy some more"
action _ = "Take one down and pass it around"

verse : Nat -> (String,String)
verse Z = (quantity Z ++ " on the wall, "  ++ quantity Z, action Z ++ ", " ++  quantity 9 ++ " on the wall.")
verse (S x) =  (quantity (S x) ++ " on the wall, " ++ quantity (S x) ++ ".\n" ,
                action (S x) ++ ", " ++ quantity x ++ " on the wall.\n")

song : Song
song = fromList $ map (verse . toNat) $ reverse [0..9]

-- Want to do this, but can't get it to compile!
--song' : (n:Nat) -> Song2 n
--song' (S x) = fromList $ map (verse . toNat) $ reverse [0..x]
