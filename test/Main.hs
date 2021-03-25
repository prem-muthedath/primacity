
{-# LANGUAGE ScopedTypeVariables #-}

module Main (main) where

import Test.QuickCheck
import Properties (factorsProduct, factorsPrime)
import Data.List (isPrefixOf, zipWith4)
import Data.Char (isSpace)
import Primacity

parseLine :: String -> String
parseLine line = "(" ++ parseLine' line [] ++ ")"
  where parseLine' :: String -> String -> String
        parseLine' [] acc = acc
        parseLine' (x:xs) acc
                | isPrefixOf "--" (x:xs) = acc
                | isPrefixOf " " (x:xs) = if f xs then acc
                                          else parseLine' (trim xs) (acc ++ ",")
                | otherwise = parseLine' xs (acc ++ [x])
          where f :: String -> Bool
                f ys
                  | all isSpace ys            = True
                  | isPrefixOf "--" (trim ys) = True
                  | otherwise                 = False
        trim :: String -> String
        trim = dropWhile isSpace

getInput :: IO [(Int, Int, Int)]
getInput = do
  contents <- readFile "./test/input.txt"
  let allLines = lines contents
      nonempty = filter (/="()")
      pLines   = nonempty . map (\line -> parseLine line) $ allLines
  return $ map (\line -> read line :: (Int, Int, Int)) pLines

parse :: String -> String
-- pattern match `Case #x: ` where x is a number in [1..100]
parse ('C':'a':'s':'e':' ':'#':_:':':' ':rest) = rest
parse ('C':'a':'s':'e':' ':'#':_:_:':':' ':rest) = rest
parse ('C':'a':'s':'e':' ':'#':_:_:_:':':' ':rest) = rest
parse str
    | "--" `isPrefixOf` str = ""
    | otherwise             = error "missing `Case #` prefix; parse failed."

getOutput :: IO [Int]
getOutput = do
  contents <- readFile "./test/output.txt"
  let allLines = lines contents
      nonempty = filter (/="")
      pLines   = nonempty . map (\line -> parse line) $ allLines
  return $ map (\x -> read x :: Int) pLines

test :: [(Int, Int, Int)] -> [Int] -> IO ()
test xs zs = do
  let ys :: [Int] = primacitys xs
      results     = zipWith4 (\n x y z -> (n, x, y, z)) [1..] xs ys zs
  printResults results

printResults :: [(Int, (Int, Int, Int), Int, Int)] -> IO ()
printResults vals = do
  putStrLn "########################################################################"
  putStrLn "TEST RESULTS -- Case # : input (a, b, k) | actual | expected | PASS/FAIL"
  putStrLn "########################################################################"
  mapM_(\(n, x, y, z) -> putStrLn $
      "Case #" ++
      show n   ++ ": " ++
      show x ++ " | " ++
      show y ++ " | "  ++
      show z ++ " | "  ++
      if (y==z) then "PASS" else "FAIL") vals

qctest :: IO ()
qctest = do
  putStrLn "########################################################################"
  putStrLn "QuickCheck Test Results"
  putStrLn "########################################################################"
  quickCheck factorsProduct
  quickCheck factorsPrime

main :: IO ()
main = do
  input <- getInput
  output' <- getOutput
  test input output'
  qctest


