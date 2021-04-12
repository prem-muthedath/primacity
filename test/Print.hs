-- | Test results headers.
-- author: Prem Muthedath.

module Print (printResults) where

import Data.List (zipWith4, sort)

import Types
import Common (showE)

-- | `Test` instance caption.
caption :: Test -> String
caption test = show test ++ " RESULTS -- Test case" ++ middle ++ end
  where middle :: String
        middle | Empty <- test = ": [(a, b, k)]"
               | otherwise     = " # : (a, b, k)"
        end :: String
        end = " | actual | expected | PASS/FAIL"

-- | `Test` instance header.
header :: Test -> String
header test = concat [seperator, "\n", caption test, "\n", seperator]
  where seperator :: String
        seperator = replicate (maxSize) '#'
        maxSize :: Int
        maxSize = last . sort $ captionSizes
        captionSizes :: [Int]
        captionSizes = map (\x -> length . caption $ x) [Normal ..]

-- | format & print test results.
printResults :: Test -> [TestCase] -> [Actual] -> [Expected] -> IO ()
printResults test xs ys zs
    | Empty <- test = printEmpty
    | otherwise     = printNonEmpty
    where printEmpty :: IO ()
          printEmpty= do
            putStrLn $ header Empty
            let (x', y', z') = (show xs, show ys, show zs)
                status       = (ys == zs)
            putStr $ "Test case : "
            print' x' y' z' status
          printNonEmpty :: IO ()
          printNonEmpty = do
            putStrLn $ header test
            mapM_(\(n, x, y, z) ->
                do let (x', y', z') = (show x, showE y, showE z)
                       status       = (y == z)
                   putStr $ "Test case #" ++  show n ++ ": "
                   print' x' y' z' status) results
          results :: [(TestCaseNo, TestCase, Actual, Expected)]
          results = zipWith4 (\n x y z -> (n, x, y, z)) [1..] xs ys zs
          print' :: String -> String -> String -> Bool -> IO ()
          print' x y z status = putStrLn $
              x ++ " | "  ++
              y ++ " | "  ++
              z ++ " | "  ++
              if status then "PASS" else "FAIL"


