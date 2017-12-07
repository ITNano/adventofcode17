module Util where

import System.Environment (getArgs)
import System.Exit (exitFailure)
import System.Directory (doesFileExist)

runTest :: Show a => (String -> a) -> String -> IO()
runTest func file = do
  exists <- doesFileExist file
  if not exists
    then putStrLn "The provided test file does not exist"
    else do
      contents <- readFile file
      putStrLn $ show $ func contents
      
dummySolution :: String -> String
dummySolution _ = "Method not implemented yet"

runMain :: (Show a, Show b) => String -> (String -> a) -> (String -> b) -> IO()
runMain name f f2 = do
  args <- getArgs
  putStrLn ""
  case args of
    [file]       -> putStr "1: " >> runTest f file
    [file,file2] -> putStr "1: " >> runTest f file >> putStr "2: " >> runTest f2 file2
    _            -> do
      putStrLn $ "Usage: " ++ name ++ " <SourceFile>"
      exitFailure
  putStrLn ""
