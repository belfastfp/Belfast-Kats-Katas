module EarthquakeKata where

import Data.List
import Control.Monad

-- Data
data Earthquake = Earthquake { magnitude :: Int } deriving (Eq, Show, Read)

instance Ord Earthquake where
  compare a b = compare (magnitude a) (magnitude b)

data Observatory = Observatory {
  name :: String,
  country :: String,
  startY :: Int,  -- year
  coverage :: Int, -- km^2
  quakes :: [Earthquake]
} deriving (Show, Read)

-- Observatory functions
addEvent :: Earthquake -> Observatory -> Observatory
addEvent e o = o { quakes = e : quakes o }

largestMag :: Observatory -> Int
largestMag = magnitude . maximum . quakes

avgMag :: Observatory -> Float
avgMag Observatory {quakes = quakes} =
  realToFrac (sum $ magnitude <$> quakes) / genericLength quakes

quakesGreaterThan :: Int -> Observatory -> [Earthquake]
quakesGreaterThan n =
  filter (\e -> magnitude e > n) . quakes

------------ Monitoring

data Monitoring = Monitoring {
  obs :: [Observatory]
}

obsWithLargestAvgMag :: Monitoring -> Observatory
obsWithLargestAvgMag m = last $ sortOn avgMag $ obs m

largestMagEvaaaah :: Monitoring -> Int
largestMagEvaaaah m = maximum $ largestMag <$> obs m

quakesGreaterThan' :: Int -> Monitoring -> [Earthquake]
quakesGreaterThan' n m = obs m >>= quakesGreaterThan n


------- IO ------
-- Note: Observatory info must be entered in the following format:
-- Observatory { name = "Irn Bru Observatory", country = "UK", startY = 1989, coverage = 200, quakes = [] }
-- Why? Because I'm lazy

main = do
  obs1 <- askForObservatory
  obs2 <- askForObservatory
  let monitoring = Monitoring [obs1, obs2]

  putStrLn "Largest average earthquake:"
  print $ avgMag $ obsWithLargestAvgMag monitoring
  putStrLn ""

  putStrLn "Largest earthquake ever:"
  print $ largestMagEvaaaah monitoring
  putStrLn ""

  putStrLn "All earthquakes with magnitude greater than 2 "
  print $ quakesGreaterThan' 2 monitoring
  putStrLn ""

  return ()


askForObservatory :: IO Observatory
askForObservatory = do
  putStrLn "Enter observatory data:"
  obs <- fmap (\ln -> read ln :: Observatory) getLine

  putStrLn "Enter the magnitude of 3 earthquakes:"
  lines <- replicateM 3 getLine
  let earthquakes = (Earthquake . read) <$> lines
  let obs' = foldr addEvent obs earthquakes

  putStrLn ""
  return obs'
