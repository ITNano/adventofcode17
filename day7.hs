import Util (runMain, dummySolution)
import Data.List
import Data.Maybe
import Data.Ord
import Data.Map (Map)
import qualified Data.Map as Map

data Prgm = Prgm { name :: String, weight :: Int, children :: [String] } deriving (Show)
instance Eq Prgm where
  (==) (Prgm _ w _) (Prgm _ w' _) = w == w'

parseLine :: String -> Prgm
parseLine s = Prgm { name = w !! 0, weight = read (w !! 1), children = parents }
  where
    w = words s
    parents = if length w > 3
      then map (takeWhile (/= ',')) (drop 3 w)
      else []
      
puzzle1 s = name $ (filter (\p -> notElem (name p) (concat (map children prgms))) prgms) !! 0
  where
    prgms = map parseLine (lines s)
    
getPrograms :: String -> Map String Prgm
getPrograms s = Map.fromList $ map (\p -> (name p, p)) (map parseLine (lines s))
      
puzzle2 s = check (getPrograms s) undefined $ fromJust $ Map.lookup (puzzle1 s) (getPrograms s)

check :: Map String Prgm -> Prgm -> Prgm -> Int
check pgms parent p = if not (allTheSame cw)
  then check pgms p (head (filter (\n -> fullWeight pgms n == oddOne) (nodes pgms p)))
  else weight (head (filter (\n -> fullWeight pgms n == oddOneP) (nodes pgms parent))) - (oddOneP - commonP)
  where
    cw = childrenWeight pgms p
    common = (head (cw \\ (nub cw)))
    oddOne = sum cw - (((length cw)-1) * common)
    cwp = childrenWeight pgms parent
    commonP = (head (cwp \\ (nub cwp)))
    oddOneP = sum cwp - (((length cwp)-1) * commonP)
    
nodes pgms p = map (fromJust . ((flip Map.lookup) pgms)) (children p)
    
childrenWeight pgms p = map (fullWeight pgms) (nodes pgms p)
    
fullWeight pgms p = weight p + sum (childrenWeight pgms p)

allTheSame :: Eq a => [a] -> Bool
allTheSame (x:x':xs) = x == x' && allTheSame (x':xs)
allTheSame (x:[])    = True
    
    
main :: IO()
main = runMain "day7" puzzle1 puzzle2