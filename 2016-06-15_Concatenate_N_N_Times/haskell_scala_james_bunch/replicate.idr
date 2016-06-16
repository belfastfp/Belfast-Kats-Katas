import Data.Vect

replN : Nat -> String
replN n = Prelude.Foldable.concat $ Prelude.List.replicate n (show n)

dt : Nat -> Type
dt n = Vect (n * (length $ show n) ) Char

-- Attempt to use dependent type - doesn't compile
dtReplN : (n:Nat) -> Vect (n * (length $ show n) ) Char
dtReplN n = Data.Vect.concat $ Data.Vect.replicate n (fromList $ unpack $ show n)


-- First try at converting haskell solution to idris...
-- candidates : String -> List String
-- candidates s = map pack $ reverse $ inits $ unpack s
--
-- unrepl : String -> Maybe String
-- unrepl "" = Nothing
-- unrepl s = let
--                -- maxDigits = ceiling $ logBase 10 (fromIntegral $ length s + 1)
--                cs = candidates s
--               --  target = length s
--               --  lg cand = 4--length cand --* read cand
--               --  ok cand = lg cand == target
--             in
--                find okChk $ tail cs
