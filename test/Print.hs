-- | Prints test results.
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
        captionSizes = map (\x -> length . caption $ x) [toEnum 0 :: Test ..]

-- | prints a test case result.
printResult :: [String] -> Bool -> IO ()
printResult result status = do
    let outcome = if status then "PASS" else "FAIL"
    mapM_ (\x -> putStr $ x ++ " | ") result    -- prints each item immediately!
    putStrLn outcome

-- | format & print test results.
printResults :: Test -> [TestCase] -> [Actual] -> [Expected] -> IO ()
printResults test xs ys zs = do
    putStrLn $ header test
    if test == Empty then printEmpty else printNonEmpty
  where printEmpty :: IO ()
        printEmpty = do
            let ps      = [show xs, show ys, show zs]
                status  = (ys == zs)
            putStr $ "Test case : "
            printResult ps status
        printNonEmpty :: IO ()
        printNonEmpty = mapM_(\(n, x, y, z) ->
              let ps     = [show x, showE y, showE z]
                  status = (y == z)
              in do putStr $ "Test case #" ++  show n ++ ": "
                    printResult ps status) results
        results :: [(TestCaseNo, TestCase, Actual, Expected)]
        results = zipWith4 (\n x y z -> (n, x, y, z)) [1..] xs ys zs


