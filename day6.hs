import Util (runMain, dummySolution)
import Data.List
import Data.Maybe

getInput :: String -> [Int]
getInput s = map read (words s)

puzzle1 :: String -> Int
puzzle1 s = length (calcSteps  [getInput s]) - 1
    
calcSteps :: [[Int]] -> [[Int]]
calcSteps (x:xs) = if elem newVal (x:xs)
  then newVal : x : xs
  else calcSteps (newVal : x : xs)
  where
    c = maximum x
    i = fromJust (findIndex (== c) x)
    change a i' = if i' == i
      then diff i'
      else a + diff i'
    diff i' = ceiling (fromIntegral (c - (mod (i' - (i+1)) (length x))) / (fromIntegral (length x)))
    newVal = zipWith change x [0..]
    
puzzle2 :: String -> Int
puzzle2 s = fromJust (findIndex (== x) xs) + 1
  where
    (x:xs) = calcSteps [getInput s]

main :: IO()
main = runMain "day6" puzzle1 puzzle2