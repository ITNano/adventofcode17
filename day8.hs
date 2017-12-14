import Util (runMain, dummySolution)
import Data.List
import Data.Maybe
import Data.Map (Map)
import qualified Data.Map as Map

data Instruction = Instr { op :: (Int -> Int), var :: Var, cond :: Condition }
type Var = String
data Condition = Cond { variable :: String, operation :: (Int -> Bool) }

parseLine :: String -> Instruction
parseLine s = case w !! 1 of
  "dec" -> Instr { op = ((flip (-)) (read (w !! 2))), var = (w !! 0), cond = getCond }
  "inc" -> Instr { op = ((flip (+)) (read (w !! 2))), var = (w !! 0), cond = getCond }
  where
    w = words s
    getCond = Cond { variable = (w !! 4), operation = getOp (w !! 5) (read (w !! 6)) }
    getOp "<"  = flip (<)
    getOp ">"  = flip (>)
    getOp "<=" = flip (<=)
    getOp ">=" = flip (>=)
    getOp "==" = flip (==)
    getOp "!=" = flip (/=)

puzzle1 :: String -> Int
puzzle1 s = maximum $ map snd (Map.toList res)
  where
    instr = map parseLine (lines s)
    res = foldr (\i m -> if (operation (cond i)) (Map.findWithDefault 0 (variable (cond i)) m) then Map.insert (var i) ((op i) (Map.findWithDefault 0 (var i) m)) m else m) Map.empty (reverse instr)
    
    
puzzle2 :: String -> Int
puzzle2 s = snd res
  where
    instr = map parseLine (lines s)
    res = foldr (\i (m, a) -> if (operation (cond i)) (Map.findWithDefault 0 (variable (cond i)) m) then (update i m, max a (Map.findWithDefault 0 (var i) (update i m))) else (m, a)) (Map.empty, 0) (reverse instr)
    update i m = Map.insert (var i) ((op i) (Map.findWithDefault 0 (var i) m)) m
   

main :: IO()
main = runMain "day8" puzzle1 puzzle2