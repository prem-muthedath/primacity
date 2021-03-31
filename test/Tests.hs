{-# LANGUAGE ScopedTypeVariables #-}

-- | Test code.
-- author: Prem Muthedath

module Tests (run) where

import Test.QuickCheck

import Text.Read (readMaybe)
import Data.List (zipWith4, stripPrefix, find)

import Types
import Inputs (testCasesFile, primacityCountsFile)
import Common (hasWordCount, replace, singleSpaced)
import Primacity (primacityCounts)
import Properties (factorsProduct, factorsPrime)
import Headers (pcHeader, qcHeader)

-- | parse line & return expected primacity count for a test case as string.
-- line pattern: `Case #x: y` where `x`, the test case number, is an integer in 
-- [1..100] & `y` can be any integer >=0. example: `"Case #10: 691209".  we want 
-- to extract & return `y`, the expected primacity count, as a string.
anExpected :: String -> Maybe String
anExpected line = do
      xs <- stripPrefix "Case #" line   -- strip "Case #" prefix
      ys <- suffixBeginsWith ':' xs     -- fetch suffix that begins with ':'
      zs <- stripPrefix ": " ys         -- strip prefix ": "
      pc <- pcount zs                   -- extract expected primacity count
      return pc
  where suffixBeginsWith :: Char -> String -> Maybe String
        suffixBeginsWith char str = do
              _ <- find (==char) str
              return $ dropWhile (/=char) str
        pcount :: String -> Maybe String
        pcount xs
            | xs `hasWordCount` 1 = Just $ singleSpaced xs
            | otherwise           = Nothing

-- | parse line & return primacity count test case as a comma-delimited string.
-- line pattern: `x y z` where `x`, `y`, `z` are +ve integers with any number of 
-- digits. example: "1673990 4964281 4". we want to extract this pattern as 
-- "x,y,z".  NOTE: `x y z` means integers in [`x`..`y`] with primacity `z`.
testCase :: String -> Maybe String
testCase line
          | valid     = Just $ format
          | otherwise = Nothing
  where valid :: Bool
        valid = line `hasWordCount` 3  -- example pattern: "156 287 6"
        format :: String
        format = replace ' ' "," . singleSpaced $ line

-- | parse a line of text.
parseLine :: (String -> Maybe String) -> String -> String
parseLine _ []          = []   -- ignore blank
parseLine _ ('-':'-':_) = []   -- ignore comment
parseLine f line = case (f line) of
                      Just x  -> x
                      Nothing -> error . show $ BadFormat line

-- | parse contents, parsing each line using a supplied parsing function.
parse :: String -> (String -> Maybe String) -> [String]
parse contents f = nonempty . map (\line -> parseLine f line) $ allLines
  where allLines :: [String]
        allLines = lines contents
        nonempty :: [String]-> [String]
        nonempty = filter (/="")

-- | format & print primacity count test results.
printResults :: [(TestCaseNo, TestCase, Actual, Expected)] -> IO ()
printResults vals = do
  pcHeader
  mapM_(\(n, x, y, z) -> putStrLn $
      "Test case #" ++  show n ++ ": " ++
      show x ++ " | "  ++
      show y ++ " | "  ++
      show z ++ " | "  ++
      if (y==z) then "PASS" else "FAIL") vals

-- | expected primacity counts.
expected :: IO [Expected]
expected = do
  contents <- readFile primacityCountsFile
  let pLines = parse contents anExpected
  return $ map (\x ->
    case readMaybe x :: Maybe Expected of
      Just y  -> y
      Nothing -> error . show $ BadPC x
    ) pLines

-- | primacity count test cases, each of type `TestCase`.
testCases :: IO [TestCase]
testCases = do
  contents <- readFile testCasesFile
  let pLines = parse contents testCase
  return $ map (\x ->
    case readMaybe $ "(" ++ x ++ ")" :: Maybe TestCase of
      Just y  -> y
      Nothing -> error . show $ BadTC x
    ) pLines

-- | run quick check tests.
quickCheckTests :: IO ()
quickCheckTests = do
  qcHeader
  quickCheck factorsProduct
  quickCheck factorsPrime

-- | run primacity count tests.
primacityCountTests :: IO ()
primacityCountTests = do
  xs :: [TestCase] <- testCases
  zs :: [Expected] <- expected
  let ys :: [Actual] = primacityCounts xs
      results        = zipWith4 (\n x y z -> (n, x, y, z)) [1..] xs ys zs
  printResults results

-- | run all tests.
run :: IO ()
run = do
  primacityCountTests
  quickCheckTests

