import Util (runMain, dummySolution)
import Data.Char

getMatrix :: String -> [[Int]]
getMatrix s = map (\x -> map (\a -> read a :: Int) (words x)) (lines s)

puzzle1 :: String -> Int
puzzle1 s = sum [maximum(ls)-minimum(ls) | ls <- (getMatrix s)]

puzzle2 :: String -> Int
puzzle2 s = sum $ map (\r -> sum [div a b | a <- r, b <- r, a /= b && mod a b == 0]) (getMatrix s)

main :: IO()
main = runMain "day2" puzzle1 puzzle2