import Util (runMain)
import Data.Char

puzzle1 :: String -> Int
puzzle1 s = sum (zipWith (\a b -> if a == b then digitToInt a else 0) s (tail s ++ [head s]))

puzzle1_v2 :: String -> Int
puzzle1_v2 s = sum $ map (\x -> if (s !! x) == (s !! (mod (x+1) l)) then digitToInt (s !! x) else 0) [1..(l-1)]
  where
    l = length s
    
puzzle1_v3 :: String -> Int
puzzle1_v3 s = sum [nums !! a | a <- [1..(length nums)-1], nums !! a == nums !! (mod (a+1) (length nums))]
  where
    nums = map digitToInt s
    
    
puzzle2 :: String -> Int
puzzle2 s = sum [nums !! a | a <- [1..(length nums)-1], nums !! a == nums !! (mod (a+hl) (length nums))]
  where
    nums = map digitToInt s
    hl = div (length nums) 2

main :: IO()
main = runMain "day1" puzzle1_v3 puzzle2