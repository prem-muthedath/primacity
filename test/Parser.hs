-- | Parses "normal" test input files for test cases & expected counts.
-- These input files contain good data -- not exception & empty test cases.
-- author: Prem Muthedath.

module Parser (testCases, expected) where

import Text.Read (readMaybe)
import Data.List (stripPrefix, find)

import Types (TestCase, Expected)
import FileParseErrors
import Inputs (testCasesFile, primacityCountsFile)
import Common (hasNWords, replace, oneSpaced, error', K)

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
        pcount xs | xs `hasNWords` 1 = Just $ oneSpaced xs
                  | otherwise        = Nothing

-- | parse line & return the primacity count test case "x y z" as "(x,y,z)".
-- line pattern: `x y z` where `x`, `y`, `z` are +ve integers with any number of 
-- digits. example: "1673990 4964281 4". we want to extract this pattern as 
-- "(x,y,z)".  NOTE: `x y z` means integers in [`x`..`y`] with primacity `z`.
testCase :: String -> Maybe String
testCase line | valid     = Just $ format
              | otherwise = Nothing
  where valid :: Bool
        valid = line `hasNWords` 3  -- example pattern: "156 287 6"
        format :: String
        format = let line'           = oneSpaced line
                     commaDelimited  = replace ' ' "," line'
                 in "(" ++ commaDelimited ++ ")"

-- | parse a line of text.
parseLine :: (String -> Maybe String) -> String -> String
parseLine f line | [] <- line           = []   -- ignore blank
                 | ('-':'-':_) <- line  = []   -- ignore comment
                 | otherwise            = parseLine' $ takeWhile (/= '-') line
  where parseLine' :: String -> String
        parseLine' line' = case (f line') of
                                Just x  -> x
                                Nothing -> error' $ LineFormatError line

-- | parse contents, parsing each line using a supplied parsing function.
parse :: String -> (String -> Maybe String) -> [String]
parse contents f = nonempty . map (\line -> parseLine f . oneSpaced $ line) $ allLines
  where allLines :: [String]
        allLines = lines contents
        nonempty :: [String]-> [String]
        nonempty = filter (/="")

-- | expected primacity counts.
-- see /u/ hammar @ https://tinyurl.com/k4fkyykk for IO-Maybe mix using <$>.
expected :: IO [Expected]
expected = f <$> readFile primacityCountsFile
  where f :: String -> [Expected]
        f contents = let pLines = parse contents anExpected
          in map (\x ->
          case readMaybe x :: Maybe K of
               Just y  -> Right y
               Nothing -> error' $ PCError x
          ) pLines

-- | primacity count test cases, each of type `TestCase`.
-- see /u/ hammar @ https://tinyurl.com/k4fkyykk for IO-Maybe mix using <$>.
testCases :: IO [TestCase]
testCases = f <$> readFile testCasesFile
  where f :: String -> [TestCase]
        f contents = let pLines = parse contents testCase
          in map (\x ->
          case readMaybe x :: Maybe TestCase of
               Just y  -> y
               Nothing -> error' $ TCError x
          ) pLines


