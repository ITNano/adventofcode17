import Util (runMain, dummySolution)
import Data.List

-- puzzle1 :: Int -> Int
puzzle1 num = abs((mod ((round num-1)-((2*layer-1)^2)) (2*layer)) - (layer-1)) + layer
  where
    layer = div (ceiling (sqrt num)) 2
    

puzzle2 maxNum curr = if res > maxNum then res else puzzle2 maxNum (curr+1)
  where
    res = solvePuzzle2 curr
    
solvePuzzle2 1   = 1    
solvePuzzle2 num = sum $ map solvePuzzle2 (filter (< num) (getNeighbours num))

getNeighbours num = [x | x <- [1..num-1], d (getCoordinate x)]
  where
    c = getCoordinate num
    d (x, y) = elem (abs (x - (fst c))) [0, 1] && elem (abs (y - (snd c))) [0, 1]
    
getCoordinate 1   = (0, 0)    
getCoordinate num = case div ((round num-1)-((2*layer-1)^2)) (2*layer) of
  0 -> (layer, c)
  1 -> (-c, layer)
  2 -> (-layer, -c)
  3 -> (c, -layer)
  where
    c = (mod ((round num-1)-((2*layer-1)^2)) (2*layer)) - (layer-1)
    layer = div (ceiling (sqrt num)) 2

main :: IO()
main = do
  putStrLn $ show $ puzzle1 325489
  putStrLn $ show $ puzzle2 325489 1