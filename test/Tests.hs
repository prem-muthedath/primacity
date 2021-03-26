{-# LANGUAGE ScopedTypeVariables #-}

-- | Test code.
-- author: Prem Muthedath

module Tests (run) where

import Test.QuickCheck

import Data.List (zipWith4, stripPrefix)

import Properties (factorsProduct, factorsPrime)
import Primacity (primacityCounts)

-- | parse a line of text.
parseLine :: (String -> Maybe String) -> String -> String
parseLine _ []          = []   -- ignore blank
parseLine _ ('-':'-':_) = []   -- ignore comment
parseLine f line = case (f line) of
                      Just x  -> x
                      Nothing -> error $ "parse failed at line: " ++ line

-- | return primacity test case as a comma-delimited string from a line of text.
-- line pattern: `x y z` where x, y, z are numbers with any number of digits.
-- example: `1673990 4964281 4`. we want to extract this pattern as "x,y,z".
-- NOTE: `x y z` means numbers in [`x`..`y`] with primacity `z`.
testCase :: String -> Maybe String
testCase line
          | valid     = Just $ replace
          | otherwise = Nothing
  where valid :: Bool
        valid = length (words line) == 3  -- example pattern: "156 287 6"
        replace :: String
        replace = concatMap (\x -> if x == ' ' then "," else [x]) line

-- | return expected primacity count from a line of text.
-- line pattern: `Case #x: y` where `x` is a number in [1..100] & `y`, the 
-- primacity count, can have any number of digits. example: `Case #10: 691209`.
anExpected :: String -> Maybe String
anExpected line = do
      xs <- stripPrefix "Case #" line
      ys <- anExpected' xs
      return ys
  where anExpected' :: String -> Maybe String
        anExpected' ys = let zs     = dropWhile (/=':') ys
                             prefix = take 2 zs
                             valid  = (zs /= ys) && (prefix == ": ")
                         in if valid then Just $ drop 2 zs else Nothing

-- | parse contents, parsing each line using a supplied parsing function.
parse :: String -> (String -> Maybe String) -> [String]
parse contents f = nonempty . map (\line -> parseLine f line) $ allLines
  where allLines :: [String]
        allLines = lines contents
        nonempty :: [String]-> [String]
        nonempty = filter (/="")

type TestCase = (Int, Int, Int)   -- primacity count test case

-- | return list of primacity test cases, each of type `TestCase`.
testCases :: IO [TestCase]
testCases = do
  contents <- readFile "./test/test-cases.txt"
  let pLines = parse contents testCase
  return $ map (\line -> read $ "(" ++ line ++ ")" :: TestCase) pLines

-- | return expected primacity counts.
expected :: IO [Int]
expected = do
  contents <- readFile "./test/expected-primacity-counts.txt"
  let pLines = parse contents anExpected
  return $ map (\x -> read x :: Int) pLines

-- | run primacity count tests.
primacityTests :: IO ()
primacityTests = do
  xs <- testCases
  zs <- expected
  let ys :: [Int] = primacityCounts xs
      results     = zipWith4 (\n x y z -> (n, x, y, z)) [1..] xs ys zs
  printResults results

-- | some type synonyms to make the code clear.
type CaseNo   = Int   -- test case number
type Actual   = Int   -- actual primacity count
type Expected = Int   -- expected primacity count

-- | format & print primacity test results.
printResults :: [(CaseNo, TestCase, Actual, Expected)] -> IO ()
printResults vals = do
  putStrLn "########################################################################################"
  putStrLn "PRIMACITY COUNT TEST RESULTS -- Case # : input (a, b, k) | actual | expected | PASS/FAIL"
  putStrLn "########################################################################################"
  mapM_(\(n, x, y, z) -> putStrLn $
      "Case #" ++  show n ++ ": " ++
      show x ++ " | " ++
      show y ++ " | "  ++
      show z ++ " | "  ++
      if (y==z) then "PASS" else "FAIL") vals

-- | run quick check tests.
qcTests :: IO ()
qcTests = do
  putStrLn "########################################################################################"
  putStrLn "QuickCheck Test Results"
  putStrLn "########################################################################################"
  quickCheck factorsProduct
  quickCheck factorsPrime

-- | run all tests.
run :: IO ()
run = do
  primacityTests
  qcTests

