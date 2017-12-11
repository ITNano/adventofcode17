import Util (runMain, dummySolution)
import Data.List

puzzle1 :: String -> Int
puzzle1 s = length $ filter uniqueWords (lines s)

uniqueWords :: String -> Bool
uniqueWords s = length (nub (words s)) == length (words s)

puzzle2 :: String -> Int
puzzle2 s =  length $ filter (\l -> uniqueWords l && noAnagrams l) (lines s)

noAnagrams :: String -> Bool
noAnagrams s = length [a | a <- (words s), b <- (words s), a /= b && sort a == sort b] == 0

main :: IO()
main = runMain "day4" puzzle1 puzzle2