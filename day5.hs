import Util (runMain, dummySolution)
import Data.List

getInput :: String -> [Int]
getInput s = map read (lines s)

-- The operator !!= replaces an entry in the given array.
(!!=) :: [a] -> (Int, a) -> [a]
(!!=) (x:xs) (i, el) | i == 0    = el : xs
                     | i >= 0    = x : (!!=) xs (i-1, el)
                     | otherwise = x : xs
(!!=) [] (i, el)                 = []



puzzle1 :: String -> Int
puzzle1 s = solvePuzzle1 (getInput s) 0 0

solvePuzzle1 :: [Int] -> Int -> Int -> Int
solvePuzzle1 d i j = do
  let val = d !! i
  if i >= length d || i < 0
    then j
    else solvePuzzle1 (d !!= (i, (d !! i)+1)) (i+val) (j+1)

puzzle2 :: String -> Int
puzzle2 s =  solvePuzzle2 (getInput s) 0 0

solvePuzzle2 :: [Int] -> Int -> Int -> Int
solvePuzzle2 d i j = do
  let val = d !! i
  if i >= length d || i < 0
    then j
    else if val >= 3
      then solvePuzzle2 (d !!= (i, (d !! i)-1)) (i+val) (j+1)
      else solvePuzzle2 (d !!= (i, (d !! i)+1)) (i+val) (j+1)

main :: IO()
main = runMain "day5" dummySolution puzzle2