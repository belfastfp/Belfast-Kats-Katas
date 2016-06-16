import Data.List

-- E.g. 7 to "7777777"
repl :: Int -> String
repl n = concat $ replicate n (show n)

-- E.g. "333" to Just "3"
unrepl :: String -> Maybe String
unrepl s = find (\c -> (length c * read c) == length s) (tail $ inits s)
