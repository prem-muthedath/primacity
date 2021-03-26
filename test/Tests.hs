{-# LANGUAGE ScopedTypeVariables #-}

module Tests (run) where

import Test.QuickCheck

import Data.List (zipWith4, stripPrefix)

import Properties (factorsProduct, factorsPrime)
import Primacity (primacitys)

parseLine :: (String -> String) -> String -> String
parseLine _ []          = []   -- ignore blank
parseLine _ ('-':'-':_) = []   -- ignore comment
parseLine f line = f line

error' :: String -> String
error' line = error $ "parse failed at line: " ++ line

parseInputLine :: String -> String
parseInputLine line
          | valid     = replace
          | otherwise = error' line
  where valid :: Bool
        valid = length (words line) == 3  -- pattern: "156 287 6"
        replace :: String
        replace = concatMap (\x -> if x == ' ' then "," else [x]) line

parseOutputLine :: String -> String
-- pattern match `Case #x: ` where x is a number in [1..100]
parseOutputLine line = parse' $ stripPrefix "Case #" line
            where parse' :: Maybe String -> String
                  parse' (Just xs) = get' xs
                  parse' Nothing   = error' line
                  get' :: String -> String
                  get' ys = let zs     = dropWhile (/=':') ys
                                prefix = take 2 zs
                                valid  = (zs /= ys) && (prefix == ": ")
                            in if valid then drop 2 zs else error' line

get :: String -> (String -> String) -> [String]
get contents f = nonempty . map (\line -> parseLine f line) $ allLines
  where allLines :: [String]
        allLines = lines contents
        nonempty :: [String]-> [String]
        nonempty = filter (/="")

type Input = (Int, Int, Int)

getInput :: IO [Input]
getInput = do
  contents <- readFile "./test/input.txt"
  let pLines = get contents parseInputLine
  return $ map (\line -> read $ "(" ++ line ++ ")" :: Input) pLines

getOutput :: IO [Int]
getOutput = do
  contents <- readFile "./test/output.txt"
  let pLines = get contents parseOutputLine
  return $ map (\x -> read x :: Int) pLines

test :: IO ()
test = do
  xs <- getInput
  zs <- getOutput
  let ys :: [Int] = primacitys xs
      results     = zipWith4 (\n x y z -> (n, x, y, z)) [1..] xs ys zs
  printResults results

type ItemNo   = Int
type Actual   = Int
type Expected = Int

printResults :: [(ItemNo, Input, Actual, Expected)] -> IO ()
printResults vals = do
  putStrLn "########################################################################"
  putStrLn "TEST RESULTS -- Case # : input (a, b, k) | actual | expected | PASS/FAIL"
  putStrLn "########################################################################"
  mapM_(\(n, x, y, z) -> putStrLn $
      "Case #" ++  show n ++ ": " ++
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

run :: IO ()
run = do
  test
  qctest

