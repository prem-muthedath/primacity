-- | Test results headers.
-- author: Prem Muthedath.

module Print (Header(..), printResults) where

import Types
import Common (showE)

-- | max caption size.
maxSize :: Int
maxSize = max (length normal) (length exception)

-- | seperator for header format.
seperator :: String
seperator = replicate (maxSize) '#'

-- | given a caption, formats it.
format :: String -> String
format caption = concat [seperator, "\n", caption, "\n", seperator]

-- | Normal primacity count test results caption.
normal :: String
normal = "PRIMACITY COUNT TEST RESULTS -- Test case # : (a, b, k) | actual | expected | PASS/FAIL"

-- | Primacity count exception test results caption.
exception :: String
exception = "PRIMACITY COUNT EXCEPTION TEST RESULTS -- Test case # : (a, b, k) | actual | expected | PASS/FAIL"

-- | represents available headings for print.
data Header = Normal | Exception deriving Eq

-- `Show` instance for `Header`.
instance Show Header where
  show Normal    = format normal
  show Exception = format exception

-- | format & print primacity count test results.
printResults :: Header -> [(TestCaseNo, TestCase, Actual, Expected)] -> IO ()
printResults header vals = do
  putStrLn . show $ header
  mapM_(\(n, x, y, z) ->
      let (x', y', z') = (show x, showE y, showE z)
      in putStrLn $ "Test case #" ++  show n ++ ": " ++
        x' ++ " | "  ++
        y' ++ " | "  ++
        z' ++ " | "  ++
        if (y == z) then "PASS" else "FAIL") vals

