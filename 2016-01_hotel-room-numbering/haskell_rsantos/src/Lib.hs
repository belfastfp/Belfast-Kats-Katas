module Lib where

solve :: String -> Maybe String
solve = scanner 0 0 [] []

-- scanner < currentRow | currentLine | lastLine | founds | input | result_maybe_BuildingFloorRoom >
scanner ::  Int -> Int -> String -> [(Char,Int,Int)] -> String -> Maybe String
scanner  _  _  _ [] [] = Nothing
scanner rn ln bl fd [] = let (_,row,line)      = head $ fd -- _ = symbol
                             (building,room) = rowToBuildingRoom 0 0 True 0 row bl
                             string = (show (building+1)) ++ (show (ln-line+1)) ++ (show (room+1))
                         in Just string
scanner rn ln bl fd ( '#':input) = scanner (rn+1)     ln (bl++"#")             fd input
scanner rn ln bl fd ( ' ':input) = scanner (rn+1)     ln (bl++" ")             fd input
scanner rn ln bl fd ('\n':input) = scanner 0      (ln+1)        []             fd input
scanner rn ln bl fd (   s:input) = scanner (rn+1)     ln (bl++"#") ((s,rn,ln):fd) input

-- rowToBuildingRoom < currentBuilding | currentRoom | spaceToBuildings | currentPosition | targetPosition | input | result_BuildingRoom >
rowToBuildingRoom :: Int -> Int -> Bool -> Int -> Int -> String -> (Int,Int)
rowToBuildingRoom b r     _ p t        _ | p == t = (b,r)
rowToBuildingRoom b r     _ p t ('#':xs) = rowToBuildingRoom b (r+1) True (p+1) t xs 
rowToBuildingRoom b _ False p t (' ':xs) = rowToBuildingRoom b 0 False (p+1) t xs 
rowToBuildingRoom b _  True p t (' ':xs) = rowToBuildingRoom (b+1) 0 False (p+1) t xs 



